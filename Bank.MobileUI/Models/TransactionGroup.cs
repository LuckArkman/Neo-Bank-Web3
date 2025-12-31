using Bank.Infrastructure.Persistence.Entities;

namespace Bank.MobileUI.Models;

public class TransactionGroup : List<LocalTransaction>
{
    public string Name { get; private set; }

    public TransactionGroup(string name, List<LocalTransaction> transactions) : base(transactions)
    {
        Name = name;
    }
}