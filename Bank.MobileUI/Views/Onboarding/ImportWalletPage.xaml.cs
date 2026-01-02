using Bank.MobileUI.ViewModels.Onboarding;
namespace Bank.MobileUI.Views.Onboarding;

public partial class ImportWalletPage : ContentPage
{
    public ImportWalletPage(ImportWalletViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }
}