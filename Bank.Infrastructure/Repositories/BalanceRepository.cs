using Bank.Domain.Entities;
using Bank.Domain.Interfaces;
using Bank.Infrastructure.Persistence.Entities;
using Microsoft.Maui.Storage;
using SQLite;

namespace Bank.Infrastructure.Repositories;

public class BalanceRepository : IBalanceRepository
{
    private readonly SQLiteAsyncConnection _database;

    public BalanceRepository()
    {
        var dbPath = Path.Combine(FileSystem.AppDataDirectory, "neobank_cache.db3");
        _database = new SQLiteAsyncConnection(dbPath);
        _database.CreateTableAsync<LocalAsset>().Wait();
    }

    public async Task<List<Asset>> GetPortfolioAsync()
    {
        var localAssets = await _database.Table<LocalAsset>().ToListAsync();
        return localAssets.Select(l => new Asset
        {
            Symbol = l.Symbol,
            Name = l.Name,
            Balance = l.Balance,
            UsdValue = l.UsdValue,
            LogoUrl = l.LogoUrl
        }).ToList();
    }

    public async Task SavePortfolioAsync(IEnumerable<Asset> assets)
    {
        var localEntities = assets.Select(a => new LocalAsset
        {
            Symbol = a.Symbol,
            Name = a.Name,
            Balance = a.Balance,
            UsdValue = a.UsdValue,
            LogoUrl = a.LogoUrl,
            LastUpdated = DateTime.UtcNow
        }).ToList();

        await _database.RunInTransactionAsync(conn =>
        {
            conn.DeleteAll<LocalAsset>();
            conn.InsertAll(localEntities);
        });
    }

    public async Task<decimal> GetTotalBalanceInUsdAsync()
    {
        return await _database.ExecuteScalarAsync<decimal>("SELECT SUM(UsdValue) FROM Assets");
    }

    // --- IMPLEMENTAÇÃO DO NOVO MÉTODO ---
    public async Task<decimal> GetBalanceFromDbAsync(string walletAddress)
    {
        // No contexto Mobile (SQLite local), o 'walletAddress' é irrelevante 
        // pois o banco local só contém os dados do usuário logado.
        // Então, reutilizamos a lógica existente:
        return await GetTotalBalanceInUsdAsync();
    }
}