using Bank.Domain.Interfaces;
using Microsoft.Extensions.Caching.Distributed;

namespace Bank.Backend.Services;

public class CachedBalanceService
{
    private readonly IDistributedCache _cache;
    private readonly IBalanceRepository _repo; // Seu repositório SQL

    public CachedBalanceService(IDistributedCache cache, IBalanceRepository repo)
    {
        _cache = cache;
        _repo = repo;
    }

    public async Task<decimal> GetBalanceAsync(string walletAddress)
    {
        string cacheKey = $"balance:{walletAddress.ToLower()}";

        // 1. Tenta ler do Redis
        string? cachedData = await _cache.GetStringAsync(cacheKey);
        if (!string.IsNullOrEmpty(cachedData))
        {
            return decimal.Parse(cachedData);
        }

        // 2. Se não existir, lê do SQL (Fonte da verdade)
        decimal balance = await _repo.GetBalanceFromDbAsync(walletAddress);

        // 3. Salva no Redis com expiração de 10 segundos
        // (Banking não pode ter cache longo, mas 10s alivia 90% da carga)
        var options = new DistributedCacheEntryOptions()
            .SetAbsoluteExpiration(TimeSpan.FromSeconds(10));

        await _cache.SetStringAsync(cacheKey, balance.ToString(), options);

        return balance;
    }
}