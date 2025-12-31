namespace Bank.MobileUI;

public partial class AppShell : Shell
{
    public AppShell()
    {
        InitializeComponent();
        
        Routing.RegisterRoute("TransferPage", typeof(Views.TransferPage));
        Routing.RegisterRoute("ScanPage", typeof(Views.ScanPage));
    }
}