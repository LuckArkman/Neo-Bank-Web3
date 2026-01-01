using Bank.Application.Messages;
using Microsoft.Maui.Storage;
using Nethereum.Web3;
using Nethereum.Web3.Accounts;

namespace Bank.Infrastructure.SmartContracts.StakingBank;

/// <summary>
/// Serviço especializado em interagir com o Smart Contract de Staking.
/// </summary>
public class StakingContractService
{
    private const string RpcUrl = "https://polygon-rpc.com";
    private const string SecureKeyAlias = "user_private_key";
    
    // Endereço do contrato de Staking (Substitua pelo endereço real do contrato deployado)
    private const string ContractAddress = "0x1234567890123456789012345678901234567890"; 

    public async Task<string> StakeRealAsync(decimal amount)
    {
        // 1. Obtém a instância Web3 autenticada (recuperando a chave do cofre seguro)
        var web3 = await GetWeb3InstanceAsync();

        // 2. Converte Decimal para BigInteger (Wei - Assumindo 18 casas decimais padrão ETH/MATIC)
        var amountInWei = Web3.Convert.ToWei(amount, 18); 

        // 3. Cria o objeto da função
        var stakeFunction = new StakeFunction
        {
            Amount = amountInWei,
            FromAddress = web3.TransactionManager.Account.Address // Define quem está enviando
        };

        // 4. Prepara o handler para enviar a transação
        var handler = web3.Eth.GetContractTransactionHandler<StakeFunction>();
        
        // 5. Envia a transação para a blockchain e aguarda o Hash
        // Nota: Em produção, você pode querer estimar o Gas antes
        var txHash = await handler.SendRequestAsync(ContractAddress, stakeFunction);

        return txHash;
    }

    /// <summary>
    /// Recupera a chave privada do armazenamento seguro e cria uma instância Web3 autenticada.
    /// </summary>
    private async Task<Web3> GetWeb3InstanceAsync()
    {
        // Recupera a chave salva durante o login/criação da carteira
        var privateKey = await SecureStorage.Default.GetAsync(SecureKeyAlias);
        
        if (string.IsNullOrEmpty(privateKey))
        {
            throw new Exception("Carteira não encontrada. Por favor, faça login novamente.");
        }

        // Cria a conta Nethereum a partir da chave privada
        var account = new Account(privateKey);
        
        // Retorna o cliente Web3 conectado à RPC com a conta configurada
        return new Web3(account, RpcUrl);
    }
}