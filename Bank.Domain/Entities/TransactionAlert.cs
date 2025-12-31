namespace Bank.Domain.Entities;

public class TransactionAlert
{
    public string? TransactionId { get; set; }
    public decimal Amount { get; set; }
    public string? FromAddress { get; set; }
    public string? ToAddress { get; set; }
    public DateTime Timestamp { get; set; }
}