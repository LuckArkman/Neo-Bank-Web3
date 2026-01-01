using Bank.Domain.Dto;
using Refit;
using Bank.Domain.Entities;

namespace Bank.Infrastructure.Api;

public interface IBankingApi
{
    [Get("/api/transactions/{address}")]
    Task<List<TransactionDTO>> GetHistoryAsync(string address);

    // NOVO MÉTODO: Adicione esta linha para corrigir o erro
    [Get("/api/fiat/moonpay-url")]
    Task<MoonPayResponse> GetMoonPayUrlAsync([AliasAs("userWalletAddress")] string address);
}