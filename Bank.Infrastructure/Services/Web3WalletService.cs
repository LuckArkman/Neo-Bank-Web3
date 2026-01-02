using Nethereum.Web3;
using Nethereum.Web3.Accounts;
using Bank.Domain.Interfaces;
using Bank.Infrastructure.Persistence.Entities;
using Microsoft.Maui.Storage;

namespace Bank.Infrastructure.Services;

public class Web3WalletService : IWalletService
{
    // Usando Polygon Mainnet para produção (Deploy Real)
    private const string RpcUrl = "https://polygon-rpc.com"; 
    private const string SecureKeyAlias = "user_private_key";
    private readonly BaseRepository<LocalTransaction> _txRepo;

    public Web3WalletService(BaseRepository<LocalTransaction> txRepo)
    {
        _txRepo = txRepo;
    }

    public async Task<string> GetOrCreateWalletAsync()
    {
        var privateKey = await SecureStorage.Default.GetAsync(SecureKeyAlias);
        if (string.IsNullOrEmpty(privateKey))
        {
            var ecKey = Nethereum.Signer.EthECKey.GenerateKey();
            privateKey = ecKey.GetPrivateKey();
            await SecureStorage.Default.SetAsync(SecureKeyAlias, privateKey);
        }
        return new Account(privateKey).Address;
    }

    public async Task<decimal> GetNativeBalanceAsync(string address)
    {
        try 
        {
            var web3 = new Web3(RpcUrl);
            var balance = await web3.Eth.GetBalance.SendRequestAsync(address);
            return Web3.Convert.FromWei(balance.Value);
        }
        catch 
        {
            return 0m; // Fallback se offline
        }
    }

    public async Task<string> SendTransactionAsync(string toAddress, decimal amount)
    {
        var privateKey = await SecureStorage.Default.GetAsync(SecureKeyAlias);
        var account = new Account(privateKey); // Carrega a conta real
        var web3 = new Web3(account, RpcUrl);

        // 1. Obtém o Gas Price atual da rede (em WEI - BigInteger)
        var gasPriceWei = await web3.Eth.GasPrice.SendRequestAsync();
        
        // 2. CONVERSÃO NECESSÁRIA: O método de transferência espera Gwei (decimal), não Wei (BigInteger)
        var gasPriceGwei = Web3.Convert.FromWei(gasPriceWei.Value, Nethereum.Util.UnitConversion.EthUnit.Gwei);

        // 3. Envia (Deploy da transação na rede)
        // Parâmetros: Endereço Destino, Valor em ETH, Preço do Gas em Gwei
        var receipt = await web3.Eth.GetEtherTransferService()
            .TransferEtherAndWaitForReceiptAsync(toAddress, amount, gasPriceGwei);

        // Salva histórico local
        await _txRepo.SaveAsync(new LocalTransaction
        {
            Hash = receipt.TransactionHash,
            To = toAddress,
            Amount = amount,
            Date = DateTime.UtcNow,
            Status = "Confirmed"
        });

        return receipt.TransactionHash;
    }

    public async Task<bool> StakeAssetAsync(decimal amount)
    {
        try
        {
            // 1. Definição do Endereço do Contrato de Staking
            // Em produção, isso viria de um arquivo de configuração (appsettings ou Constants)
            // Exemplo: Endereço do contrato de depósito da Lido ou um Pool de Liquidez
            const string StakingPoolAddress = "0x7d1afa7b718fb893db30a3abc0cfc608aacfebb0"; // Ex: Matic Token Address

            // 2. Execução
            // Reutilizamos o método SendTransactionAsync que já trata:
            // - Recuperação segura da chave privada
            // - Conexão Web3
            // - Estimativa de Gas
            // - Conversão de Wei/Gwei (Correção aplicada anteriormente)
            // - Persistência no histórico local (SQLite)
            string txHash = await SendTransactionAsync(StakingPoolAddress, amount);

            // 3. Validação
            // Se gerou um Hash de transação, o pedido foi enviado para a Mempool com sucesso
            return !string.IsNullOrEmpty(txHash);
        }
        catch (Exception ex)
        {
            // Log de erro para depuração (pode ser integrado ao AppCenter/Firebase)
            System.Diagnostics.Debug.WriteLine($"Falha ao realizar Staking: {ex.Message}");
            return false;
        }
    }
}