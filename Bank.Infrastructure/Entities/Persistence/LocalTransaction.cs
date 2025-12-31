using SQLite;

namespace Bank.Infrastructure.Persistence.Entities;

[Table("Transactions")]
public class LocalTransaction
{
    [PrimaryKey]
    public string Hash { get; set; } // O Hash é o ID único
    public string From { get; set; }
    public string To { get; set; }
    public decimal Amount { get; set; }
    public DateTime Date { get; set; }
    public string Status { get; set; } // "Pending", "Confirmed", "Failed"
}