using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Bank.Domain.Interfaces;
using Bank.MobileUI.Services;

namespace NeoBank.MobileUI.ViewModels;

[QueryProperty(nameof(TargetAddress), "toAddress")] // Permite receber endereço via DeepLink ou QR Scan
public partial class TransferViewModel : ObservableObject
{
    private readonly IWalletService _walletService;

    [ObservableProperty]
    private string targetAddress;

    [ObservableProperty]
    private decimal amount;

    [ObservableProperty]
    private bool isBusy;

    public TransferViewModel(IWalletService walletService)
    {
        _walletService = walletService;
    }

    [RelayCommand]
    private async Task ScanQrCodeAsync()
    {
        // Navega para a página de Scanner (implementada abaixo)
        await Shell.Current.GoToAsync("ScanPage");
    }

    [RelayCommand]
    private async Task ConfirmTransactionAsync()
    {
        if (IsBusy) return;
        if (amount <= 0) 
        {
            await Shell.Current.DisplayAlert("Erro", "Valor inválido.", "OK");
            return;
        }

        try
        {
            IsBusy = true;

            // 1. Segurança: Exige Biometria
            bool authorized = await SecurityService.AuthenticateUserAsync("Confirme a transferência com sua biometria");
            if (!authorized) return;

            // 2. Execução: Chama o serviço Web3
            // Nota: Em um app real, faríamos primeiro uma EstimateGasAsync para mostrar a taxa ao usuário
            string txHash = await _walletService.SendTransactionAsync(TargetAddress, Amount);

            await Shell.Current.DisplayAlert("Sucesso", $"Transação enviada!\nHash: {txHash.Substring(0, 10)}...", "OK");
            
            // Retorna ao Dashboard
            await Shell.Current.GoToAsync(".."); 
        }
        catch (Exception ex)
        {
            await Shell.Current.DisplayAlert("Falha", $"Erro na transação: {ex.Message}", "OK");
        }
        finally
        {
            IsBusy = false;
        }
    }
}