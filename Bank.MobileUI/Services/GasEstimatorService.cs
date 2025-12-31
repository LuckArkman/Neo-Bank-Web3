using Nethereum.Hex.HexTypes;
using Nethereum.Web3;

namespace Bank.MobileUI.Services;

public class GasEstimatorService
{
    private readonly Web3 _web3;

    public async Task<(decimal NativeFee, decimal UsdFee)> EstimateTransferFeeAsync(string toAddress, decimal amount)
    {
        // 1. Obtém o preço atual do Gas (Wei)
        var gasPrice = await _web3.Eth.GasPrice.SendRequestAsync();
        
        // 2. Estima o uso de Gas (Limit) para uma transferência padrão
        // Transferência simples geralmente é 21000, mas é bom estimar
        var gasLimit = new HexBigInteger(21000);

        // 3. Calcula o custo total
        var totalFeeInWei = gasPrice.Value * gasLimit.Value;
        var totalFeeInNative = Web3.Convert.FromWei(totalFeeInWei);

        // 4. Converte para USD (Mock de preço do ETH/MATIC)
        decimal nativePriceInUsd = 2500m; // Em prod, buscar de API (CoinGecko)
        var feeInUsd = totalFeeInNative * nativePriceInUsd;

        return (totalFeeInNative, feeInUsd);
    }
}