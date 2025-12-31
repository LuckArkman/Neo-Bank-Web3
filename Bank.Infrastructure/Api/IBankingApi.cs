using Refit;
using Bank.Domain.Entities;

namespace Bank.Infrastructure.Api;

public interface IBankingApi
{
    [Get("/api/transactions/{address}")]
    Task<List<TransactionDTO>> GetHistoryAsync(string address);
}