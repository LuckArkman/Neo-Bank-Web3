using Bank.Domain.Interfaces;

namespace Bank.Infrastructure.Services;

public class SwapService : ISwapService
{
    private readonly IWalletService _walletService; // Reuso do serviço base

    public SwapService(IWalletService walletService)
    {
        _walletService = walletService;
    }

    public async Task<QuoteDto> GetQuoteAsync(string fromToken, string toToken, decimal amount)
    {
        // Simulação de preço (Hardcoded para MVP)
        // Ex: 1 ETH = 3000 USDC
        decimal rate = (fromToken == "ETH" && toToken == "USDC") ? 3000m : 0.00033m;
        
        await Task.Delay(500); // Latência de rede
        
        return new QuoteDto(
            EstimatedOutput: amount * rate, 
            GasFee: 0.005m, // Taxa em Token Nativo
            RoutePath: "Uniswap V3"
        );
    }

    public async Task<string> ApproveTokenAsync(string tokenAddress, decimal amount)
    {
        return await _walletService.SendTransactionAsync(tokenAddress, 0); // Mock transaction
    }

    public async Task<string> ExecuteSwapAsync(string fromToken, string toToken, decimal amount, decimal minAmountOut)
    {
        return await _walletService.SendTransactionAsync("0xRouterAddress...", 0); // Mock transaction
    }
}