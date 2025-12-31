using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Bank.Domain.Entities;
using Bank.Domain.Interfaces;
using System.Collections.ObjectModel;
using Bank.Application.Messages;
using CommunityToolkit.Mvvm.Messaging;

namespace Bank.MobileUI.ViewModels;

public partial class DashboardViewModel : ObservableObject
{
    private readonly IWalletService _walletService;

    [ObservableProperty]
    private string _walletAddress;

    [ObservableProperty]
    private decimal _totalBalance;

    [ObservableProperty]
    private bool _isLoading;
    public ObservableCollection<Asset> Assets { get; } = new();

    public DashboardViewModel(IWalletService walletService)
    {
        _walletService = walletService;

        // Registra o ouvinte da mensagem
        WeakReferenceMessenger.Default.Register<BalanceChangedMessage>(this, (r, m) =>
        {
            TotalBalance = m.Value;
        });
        /*
        _realTimeService.OnMoneyReceived += (amount) =>
        {
            MainThread.BeginInvokeOnMainThread(async () =>
            {
                // Atualiza saldo
                await LoadDataAsync(); 
        
                // Mostra Toast (usando CommunityToolkit.Maui)
                var toast = Toast.Make($"💰 Recebido: {amount} ETH/MATIC", ToastDuration.Long);
                await toast.Show();
            });
        };
        */
        Task.Run(LoadDataAsync); 
    }

    [RelayCommand]
    public async Task LoadDataAsync()
    {
        if (IsLoading) return;
        IsLoading = true;
        
        try
        {
            // Dados fiéis à imagem de referência da UXDA
            TotalBalance = 90356.87m;
            WalletAddress = await _walletService.GetOrCreateWalletAsync();

            Assets.Clear();
            
            // 1. Débito (Restaurante)
            Assets.Add(new Asset { Name = "Tamarin", Symbol = "Tamarin restaurant", UsdValue = -125.00m });

            // 2. Social (Feed)
            Assets.Add(new Asset { Name = "John Smith", Symbol = "rated Car loans with 5 stars", UsdValue = 0.00m });

            // 3. Crédito (Entrada)
            Assets.Add(new Asset { Name = "My account", Symbol = "from Husband account", UsdValue = 500.00m });

            // 4. Débito (Saída)
            Assets.Add(new Asset { Name = "Husband account", Symbol = "from Husband account", UsdValue = -500.00m });
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Erro: {ex.Message}");
        }
        finally { IsLoading = false; }
    }
}