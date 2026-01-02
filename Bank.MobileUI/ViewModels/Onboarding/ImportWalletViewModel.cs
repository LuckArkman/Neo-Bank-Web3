using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace Bank.MobileUI.ViewModels.Onboarding;

public partial class ImportWalletViewModel : ObservableObject
{
    [ObservableProperty]
    private string _privateKeyInput;

    [ObservableProperty]
    private bool _isBusy;

    [RelayCommand]
    private async Task ImportAsync()
    {
        if (string.IsNullOrWhiteSpace(PrivateKeyInput))
        {
            await Microsoft.Maui.Controls.Application.Current.MainPage.DisplayAlert("Erro", "Cole sua chave privada.", "OK");
            return;
        }

        IsBusy = true;
        try
        {
            string cleanKey = PrivateKeyInput.Trim();
            
            // 1. Validação Básica de Formato Web3 (Hexadecimal, 64 chars)
            if (cleanKey.StartsWith("0x")) cleanKey = cleanKey.Substring(2);
            
            if (cleanKey.Length != 64)
            {
                await Microsoft.Maui.Controls.Application.Current.MainPage.DisplayAlert("Erro", "Formato de chave privada inválido.", "OK");
                return;
            }

            // 2. Tenta gerar o endereço para validar se a chave funciona (Nethereum)
            try 
            {
                var account = new Nethereum.Web3.Accounts.Account(cleanKey);
                // Se não der erro, a chave é válida
            }
            catch
            {
                await Microsoft.Maui.Controls.Application.Current.MainPage.DisplayAlert("Erro", "Chave privada inválida.", "OK");
                return;
            }

            // 3. Salva no SecureStorage
            await SecureStorage.Default.SetAsync("user_private_key", cleanKey);

            // 4. Redireciona para o AppShell (Dashboard)
            Microsoft.Maui.Controls.Application.Current.MainPage = new AppShell();
        }
        catch (Exception ex)
        {
            await Microsoft.Maui.Controls.Application.Current.MainPage.DisplayAlert("Erro", "Falha ao importar: " + ex.Message, "OK");
        }
        finally
        {
            IsBusy = false;
        }
    }

    [RelayCommand]
    private async Task BackAsync()
    {
        await Shell.Current.GoToAsync("..");
    }
}