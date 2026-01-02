using Bank.MobileUI.Views.Onboarding;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace Bank.MobileUI.ViewModels;

public partial class ImportWalletViewModel : ObservableObject
{
    private readonly IServiceProvider _services;
    
    public ImportWalletViewModel(IServiceProvider services)
    {
        _services = services;
    }

    // ... método ImportAsync existente ...

    [RelayCommand]
    private void Back()
    {
        // CORREÇÃO: Voltar manualmente para WelcomePage
        if (Microsoft.Maui.Controls.Application.Current != null)
        {
            var welcomePage = _services.GetRequiredService<WelcomePage>();
            Microsoft.Maui.Controls.Application.Current.MainPage = welcomePage;
        }
    }
}