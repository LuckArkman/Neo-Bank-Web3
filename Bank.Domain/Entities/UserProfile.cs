namespace Bank.Domain.Entities;

public class UserProfile
{
    public string WalletAddress { get; set; }
    public KycStatus Status { get; set; }
    public decimal DailyLimit { get; set; }
}