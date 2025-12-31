using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;

namespace Bank.MobileUI.ViewModels;

public partial class StakingViewModel : ObservableObject
{
    [ObservableProperty]
    private decimal currentApy = 5.4m; // Exemplo: 5.4% ao ano

    [ObservableProperty]
    private decimal stakedBalance = 0;

    public ObservableCollection<StakingPool> Pools { get; } = new();

    public StakingViewModel()
    {
        // Mock de Pools de Staking
        Pools.Add(new StakingPool("Lido Staked ETH", "stETH", 3.8m, "Baixo"));
        Pools.Add(new StakingPool("Rocket Pool", "rETH", 4.1m, "Médio"));
        Pools.Add(new StakingPool("Aave Lending", "aUSDC", 5.4m, "Baixo"));
    }

    [RelayCommand]
    private async Task StakeAssetsAsync(StakingPool pool)
    {
        // Lógica de depositar no contrato específico do Pool
        string result = await Shell.Current.DisplayActionSheet(
            $"Staking em {pool.Name}", "Cancelar", null, "Confirmar (APY " + pool.Apy + "%)");

        if (result.Contains("Confirmar"))
        {
            // Chamaria _walletService.StakeAssetAsync(...)
            StakedBalance += 100; // Mock atualização visual
            await Shell.Current.DisplayAlert("Sucesso", "Seus ativos estão rendendo!", "OK");
        }
    }
}

public record StakingPool(string Name, string Symbol, decimal Apy, string Risk);