using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Bank.Domain.Interfaces;

namespace Bank.MobileUI.ViewModels.Onboarding;

[QueryProperty(nameof(TargetAddress), "toAddress")]
[QueryProperty(nameof(Amount), "amount")]
public partial class TransferViewModel : ObservableObject
{
    private readonly IWalletService _walletService;

    [ObservableProperty] private string targetAddress;
    [ObservableProperty] private decimal amount;
    [ObservableProperty] private bool isBusy;
    [ObservableProperty] private decimal balance;

    public TransferViewModel(IWalletService walletService)
    {
        _walletService = walletService;
        LoadBalance();
    }

    private async void LoadBalance()
    {
        // Obtém o endereço e depois o saldo real da blockchain
        var address = await _walletService.GetOrCreateWalletAsync();
        Balance = await _walletService.GetNativeBalanceAsync(address);
    }

    [RelayCommand]
    private async Task ScanQrCodeAsync()
    {
        await Shell.Current.GoToAsync("ScanPage");
    }

    [RelayCommand]
    private async Task ConfirmTransactionAsync()
    {
        if (IsBusy) return;
        if (string.IsNullOrEmpty(TargetAddress)) { await Shell.Current.DisplayAlert("Erro", "Endereço inválido", "OK"); return; }
        
        try
        {
            IsBusy = true;
            
            // 1. Simula biometria (em prod usar Plugin.Fingerprint)
            bool auth = await Shell.Current.DisplayAlert("Biometria", "Confirme com sua digital", "Confirmar", "Cancelar");
            if(!auth) return;

            // 2. Envia Transação Real para Blockchain (Deploy)
            string txHash = await _walletService.SendTransactionAsync(TargetAddress, Amount);

            await Shell.Current.DisplayAlert("Sucesso", $"Transação enviada!\nHash: {txHash[..10]}...", "OK");
            await Shell.Current.GoToAsync("..");
        }
        catch (Exception ex)
        {
            await Shell.Current.DisplayAlert("Erro", $"Falha na transação: {ex.Message}", "OK");
        }
        finally
        {
            IsBusy = false;
        }
    }
}