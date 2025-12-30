using Bank.Domain.Interfaces;
using Nethereum.Web3;
using Nethereum.Web3.Accounts;
using Microsoft.Maui.Storage; // Nativo do .NET MAUI

namespace Bank.Infrastructure.Services;

public class Web3WalletService : IWalletService
{
    // Usando RPC público da Polygon (Exemplo para MVP - Em prod usar Infura/Alchemy)
    private const string RpcUrl = "https://polygon-rpc.com"; 
    private const string SecureKeyAlias = "user_private_key";

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

    public async Task<bool> StakeAssetAsync(decimal amount)
    {
        await Task.Delay(1000); // Simulando tempo de bloco
        return true;
    }
}