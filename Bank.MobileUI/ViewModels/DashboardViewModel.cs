using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Bank.Domain.Entities;
using Bank.Domain.Interfaces;
using System.Collections.ObjectModel;
using Bank.Domain.Interfaces;

namespace Bank.MobileUI.ViewModels;

public partial class DashboardViewModel : ObservableObject
{
    private readonly IWalletService _walletService;

    [ObservableProperty]
    private string walletAddress;

    [ObservableProperty]
    private decimal totalBalance;

    [ObservableProperty]
    private bool isLoading;

    public ObservableCollection<Asset> Assets { get; } = new();

    public DashboardViewModel(IWalletService walletService)
    {
        _walletService = walletService;
        LoadDataCommand.Execute(null);
    }

    [RelayCommand]
    private async Task LoadDataAsync()
    {
        IsLoading = true;
        try
        {
            // 1. Carrega ou cria carteira
            WalletAddress = await _walletService.GetOrCreateWalletAsync();

            // 2. Busca saldo na Blockchain
            var nativeBalance = await _walletService.GetNativeBalanceAsync(WalletAddress);
            TotalBalance = nativeBalance;

            // 3. Popula lista de ativos (Mock inicial + Dados reais)
            Assets.Clear();
            Assets.Add(new Asset { Symbol = "MATIC", Name = "Polygon", Balance = nativeBalance, UsdValue = nativeBalance * 0.85m });
            Assets.Add(new Asset { Symbol = "USDC", Name = "USD Coin", Balance = 150.00m, UsdValue = 150.00m }); // Mock token
        }
        catch (Exception ex)
        {
            // Tratar erro (Exibir Toast/Alert)
            Console.WriteLine(ex.Message);
        }
        finally
        {
            IsLoading = false;
        }
    }

    [RelayCommand]
    private async Task StakeAsync()
    {
        IsLoading = true;
        bool success = await _walletService.StakeAssetAsync(10); // Stake fixo de teste
        IsLoading = false;
        
        if(success) 
            await Shell.Current.DisplayAlert("Web3", "Staking realizado com sucesso na Blockchain!", "OK");
    }
}