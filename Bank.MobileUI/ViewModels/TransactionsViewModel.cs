using System.Collections.ObjectModel;
using Bank.MobileUI.Models;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using NBitcoin;

namespace Bank.MobileUI.ViewModels;

public partial class TransactionsViewModel : ObservableObject
{
    private readonly ITransactionRepository _repository;
    
    // Lista agrupada para a UI
    public ObservableCollection<TransactionGroup> GroupedTransactions { get; } = new();

    [RelayCommand]
    public async Task LoadHistoryAsync()
    {
        /*
        var rawList = await _repository.GetAllAsync();

        // Lógica LINQ poderosa para agrupar
        var groupedData = rawList
            .OrderByDescending(t => t.Date)
            .GroupBy(t => 
            {
                var date = t.Date.ToLocalTime().Date;
                if (date == DateTime.Today) return "Hoje";
                if (date == DateTime.Today.AddDays(-1)) return "Ontem";
                return date.ToString("MMMM yyyy"); // Ex: Dezembro 2024
            });

        GroupedTransactions.Clear();
        foreach (var group in groupedData)
        {
            GroupedTransactions.Add(new TransactionGroup(group.Key, group.ToList()));
        }
        */
    }
}