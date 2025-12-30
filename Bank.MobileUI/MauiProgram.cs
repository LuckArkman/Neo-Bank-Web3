using Bank.Domain.Interfaces;
using Bank.Infrastructure.Services;
using Bank.MobileUI.ViewModels;
using Bank.MobileUI.Views;
using Microsoft.Extensions.Logging;

namespace Bank.MobileUI;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });
        
        builder.Services.AddSingleton<IWalletService, Web3WalletService>();

        // 2. Registrar ViewModels
        builder.Services.AddTransient<DashboardViewModel>();

        // 3. Registrar Pages
        builder.Services.AddTransient<DashboardPage>();

#if DEBUG
        builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}