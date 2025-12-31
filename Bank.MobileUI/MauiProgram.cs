using Bank.Domain.Interfaces;
using Bank.Infrastructure.Api;
using Bank.Infrastructure.Services;
using Bank.MobileUI.ViewModels;
using Bank.MobileUI.Views;
using ZXing.Net.Maui.Controls;
using Microsoft.Extensions.Logging;
using Polly;
using Polly.Extensions.Http;
using Refit;

namespace Bank.MobileUI;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .UseBarcodeReader()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });
        
        builder.Services.AddSingleton<IWalletService, Web3WalletService>();
        builder.Services.AddRefitClient<IBankingApi>()
            .ConfigureHttpClient(c => c.BaseAddress = new Uri("https://meu-neobank-backend.azurewebsites.net"));

        // 2. Registrar ViewModels
        builder.Services.AddTransient<DashboardViewModel>();

        // 3. Registrar Pages
        builder.Services.AddTransient<DashboardPage>();
        
        var retryPolicy = HttpPolicyExtensions
            .HandleTransientHttpError()
            .WaitAndRetryAsync(3, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));

// Aplicando ao cliente Refit (API Backend)
        builder.Services.AddRefitClient<IBankingApi>()
            .ConfigureHttpClient(c => c.BaseAddress = new Uri("..."))
            .AddPolicyHandler(retryPolicy);

#if DEBUG
        builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}