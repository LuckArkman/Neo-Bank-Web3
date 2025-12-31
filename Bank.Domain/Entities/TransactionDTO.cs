namespace Bank.Domain.Entities;

public class TransactionDTO
{
    public string Hash { get; set; }
    public string Type { get; set; }
    public decimal Amount { get; set; }
    public DateTime Timestamp { get; set; }
}