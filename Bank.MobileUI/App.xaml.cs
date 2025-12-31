using Microsoft.Maui.Controls;
namespace Bank.MobileUI;

public partial class App : Microsoft.Maui.Controls.Application
{
    public App()
    {
        InitializeComponent();
    }

    protected override Window CreateWindow(IActivationState? activationState)
    {
        return new Window(new AppShell());
    }
    
    protected override async void OnAppLinkRequestReceived(Uri uri)
    {
        base.OnAppLinkRequestReceived(uri);

        // Formato esperado: neobank://pay?to=0xAddress&amount=0.5
        if (uri.Scheme.Equals("neobank") && uri.Host.Equals("pay"))
        {
            var query = System.Web.HttpUtility.ParseQueryString(uri.Query);
            string to = query.Get("to");
            string amount = query.Get("amount");

            // Navega para a TransferPage passando parâmetros
            await Shell.Current.GoToAsync($"//TransferPage?toAddress={to}&amount={amount}");
        }
    }
}