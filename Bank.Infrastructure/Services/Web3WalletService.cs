using Bank.Domain.Interfaces;
using Bank.Infrastructure.Persistence.Entities;
using Nethereum.Web3;
using Nethereum.Web3.Accounts;
using Microsoft.Maui.Storage;

namespace Bank.Infrastructure.Services;

public class Web3WalletService : IWalletService
{
    // Usando RPC público da Polygon (Exemplo para MVP - Em prod usar Infura/Alchemy)
    private const string RpcUrl = "https://polygon-rpc.com"; 
    private const string SecureKeyAlias = "user_private_key";
    private readonly BaseRepository<LocalTransaction> _txRepo;

    public async Task<string> GetOrCreateWalletAsync()
    {
        // Tenta recuperar chave privada segura
        var privateKey = await SecureStorage.GetAsync(SecureKeyAlias);

        if (string.IsNullOrEmpty(privateKey))
        {
            // Cria nova carteira se não existir (Onboarding)
            var ecKey = Nethereum.Signer.EthECKey.GenerateKey();
            privateKey = ecKey.GetPrivateKey();
            
            // Salva no Keystore do Android / Secure Enclave do iOS
            await SecureStorage.SetAsync(SecureKeyAlias, privateKey);
        }

        var account = new Account(privateKey);
        return account.Address;
    }

    public async Task<decimal> GetNativeBalanceAsync(string address)
    {
        var web3 = new Web3(RpcUrl);
        var balance = await web3.Eth.GetBalance.SendRequestAsync(address);
        return Web3.Convert.FromWei(balance.Value);
    }
    /*
    public async Task<string> SendTransactionAsync(string toAddress, decimal amount)
    {
        var privateKey = await SecureStorage.GetAsync(SecureKeyAlias);
        if (string.IsNullOrEmpty(privateKey)) throw new Exception("Wallet not found");

        var account = new Account(privateKey);
        var web3 = new Web3(account, RpcUrl);

        // Transação simples de transferência
        var transactionReceipt = await web3.Eth.GetEtherTransferService()
            .TransferEtherAndWaitForReceiptAsync(toAddress, amount);

        return transactionReceipt.TransactionHash;
    }
    */
    
    public async Task<string> SendTransactionAsync(string toAddress, decimal amount)
    {
        var web3 = new Web3();
        // ... (Lógica de envio Web3 existente) ...
        var txHash = await web3.Eth.GetEtherTransferService().TransferEtherAndWaitForReceiptAsync(toAddress, amount);

        // PERSISTÊNCIA: Salvar transação localmente
        await _txRepo.SaveAsync(new LocalTransaction
        {
            Hash = txHash.TransactionHash,
            //From = account.Address,
            To = toAddress,
            Amount = amount,
            Date = DateTime.UtcNow,
            Status = "Pending" // Marcamos como pendente até o indexador confirmar
        });

        return txHash.TransactionHash;
    }

    public async Task<bool> StakeAssetAsync(decimal amount)
    {
        await Task.Delay(1000); // Simulando tempo de bloco
        return true;
    }
    public async Task<string> StakeAssetAsync(decimal amount, string contractAddress, string abi)
    {
        var privateKey = await SecureStorage.GetAsync("user_private_key");
        var account = new Account(privateKey);
        var web3 = new Web3(account, "https://polygon-rpc.com");

        var contract = web3.Eth.GetContract(abi, contractAddress);

        // Passo 1: Converter valor decimal para Wei (BigInteger)
        // Assumindo token com 18 casas decimais
        var amountInWei = Web3.Convert.ToWei(amount);

        // Passo 2: Chamar a função 'deposit' ou 'stake' do contrato
        var depositFunction = contract.GetFunction("deposit");

        // Estimar Gas antes de enviar
        var gas = await depositFunction.EstimateGasAsync(account.Address, null, null, amountInWei);
    
        // Enviar transação
        var receipt = await depositFunction.SendTransactionAsync(
            account.Address, 
            gas, 
            null, // Value (se for ETH nativo)
            amountInWei // Parâmetro da função
        );

        return receipt;
    }
}