using NBitcoin;
using Nethereum.HdWallet;

namespace Bank.Infrastructure.Services;

public class WalletCreationService
{
    public (string Mnemonic, string Address, string PrivateKey) GenerateNewWallet()
    {
        // Gera entropia segura e as 12 palavras
        var wallet = new Wallet(Wordlist.English, WordCount.Twelve);
        
        return (
            string.Join(" ", wallet.Words), 
            wallet.GetAccount(0).Address, 
            wallet.GetAccount(0).PrivateKey
        );
    }
}