using Microsoft.Maui.Storage;
using SQLite;
namespace Bank.Infrastructure.Persistence.Entities;
public class BaseRepository<T> where T : new()
{
    private SQLiteAsyncConnection _database;

    public BaseRepository()
    {
        // Define o caminho do banco de dados no dispositivo
        var dbPath = Path.Combine(FileSystem.AppDataDirectory, "neobank_cache.db3");
        _database = new SQLiteAsyncConnection(dbPath);
        
        // Cria a tabela se não existir (Non-blocking)
        _database.CreateTableAsync<T>().Wait(); 
    }

    public async Task<List<T>> GetAllAsync() => await _database.Table<T>().ToListAsync();
    
    public async Task<int> SaveAsync(T item) => await _database.InsertOrReplaceAsync(item);
    
    public async Task<int> DeleteAsync(object primaryKey) => await _database.DeleteAsync<T>(primaryKey);
}