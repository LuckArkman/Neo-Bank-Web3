namespace Bank.Domain.Interfaces;

public interface ISwapService
{
    // 1. Cotação: Quanto recebo se vender X tokens?
    Task<QuoteDto> GetQuoteAsync(string fromToken, string toToken, decimal amount);
    
    // 2. Aprovação: Permitir que o contrato gaste meus tokens (Obrigatório em ERC-20)
    Task<string> ApproveTokenAsync(string tokenAddress, decimal amount);
    
    // 3. Execução: Realizar a troca
    Task<string> ExecuteSwapAsync(string fromToken, string toToken, decimal amount, decimal minAmountOut);
}

public record QuoteDto(decimal EstimatedOutput, decimal GasFee, string RoutePath);