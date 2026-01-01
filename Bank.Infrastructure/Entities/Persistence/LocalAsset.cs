using SQLite;

namespace Bank.Infrastructure.Persistence.Entities;

[Table("Assets")]
public class LocalAsset
{
    [PrimaryKey]
    public string Symbol { get; set; } // Ex: ETH, MATIC (Chave única)
    
    public string Name { get; set; }
    public decimal Balance { get; set; }
    public decimal UsdValue { get; set; }
    public string LogoUrl { get; set; }
    public DateTime LastUpdated { get; set; }
}