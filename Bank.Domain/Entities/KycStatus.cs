namespace Bank.Domain.Entities;

public enum KycStatus
{
    Pending,
    DocumentsSubmitted,
    Approved,
    Rejected
}