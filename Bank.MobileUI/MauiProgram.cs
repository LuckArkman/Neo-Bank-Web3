using Microsoft.Extensions.Logging;
using Bank.MobileUI.ViewModels;
using Bank.MobileUI.Views;
using Bank.MobileUI.Views.Fiat;
using Bank.Domain.Interfaces;
using Bank.Infrastructure.Services;
using Bank.Infrastructure.Api;
using Bank.Infrastructure.Persistence.Entities;
using Bank.Infrastructure.SmartContracts.StakingBank;
using NeoBank.MobileUI.ViewModels;
using Refit;
using ZXing.Net.Maui.Controls;
using Web3WalletService = Bank.Infrastructure.Services.Web3WalletService; // Necessário para QR Code

namespace Bank.MobileUI;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .UseBarcodeReader() // Inicializa ZXing
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

        // 1. Configuração de APIs (Refit)
        // Nota: Em emulador Android, localhost é 10.0.2.2
        string backendUrl = DeviceInfo.Platform == DevicePlatform.Android ? "http://10.0.2.2:5000" : "http://localhost:5000";
        
        builder.Services.AddRefitClient<IBankingApi>()
               .ConfigureHttpClient(c => c.BaseAddress = new Uri(backendUrl));

        // 2. Services Infrastructure
        builder.Services.AddSingleton<IWalletService, Web3WalletService>(); // Unificado
        builder.Services.AddSingleton<ISwapService, SwapService>();
        builder.Services.AddSingleton<BaseRepository<LocalTransaction>>();
        
        // 3. ViewModels
        builder.Services.AddTransient<DashboardViewModel>();
        builder.Services.AddTransient<TransactionsViewModel>();
        builder.Services.AddTransient<TransferViewModel>();
        builder.Services.AddTransient<SwapViewModel>();
        builder.Services.AddTransient<StakingViewModel>();
        builder.Services.AddSingleton<StakingContractService>();

        // 4. Views
        builder.Services.AddTransient<DashboardPage>();
        builder.Services.AddTransient<HistoryPage>();
        builder.Services.AddTransient<TransferPage>();
        builder.Services.AddTransient<ScanPage>();
        builder.Services.AddTransient<SwapPage>();
        builder.Services.AddTransient<StakingPage>();
        builder.Services.AddTransient<BuyCryptoPage>();
        Routing.RegisterRoute(nameof(ScanPage), typeof(ScanPage));

#if DEBUG
        builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}