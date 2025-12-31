using Nethereum.Web3;

namespace Bank.Infrastructure.SmartContracts.StakingBank;

public class Web3WalletService
{
    public async Task<string> StakeRealAsync(decimal amount)
    {
        var web3 = GetWeb3Instance(); // Instância autenticada com Private Key
        var contractAddress = "0xseu_contrato_na_polygon";

        // 1. Converte Decimal para BigInteger (Wei/Units)
        var amountInWei = Web3.Convert.ToWei(amount, 18); // Assumindo 18 decimais

        // 2. Cria a mensagem de função gerada pelo Nethereum
        var stakeFunction = new StakeFunction
        {
            Amount = amountInWei
        };

        // 3. Envia a transação
        var handler = web3.Eth.GetContractTransactionHandler<StakeFunction>();
        var txHash = await handler.SendRequestAsync(contractAddress, stakeFunction);

        return txHash;
    }
}