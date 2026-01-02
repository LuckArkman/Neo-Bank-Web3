using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using Refit;
using ZXing.Net.Maui.Controls;
using Bank.MobileUI.Views;
using Bank.MobileUI.Views.Fiat;
using Bank.MobileUI.Views.Onboarding;
using Bank.MobileUI.ViewModels;
// using Bank.MobileUI.ViewModels.Onboarding; // Vamos usar explícito abaixo para garantir
using Bank.Domain.Interfaces;
using Bank.Infrastructure.Services;
using Bank.Infrastructure.Api;
using Bank.Infrastructure.Persistence.Entities;
using Bank.Infrastructure.Repositories;
using Bank.Infrastructure.SmartContracts.StakingBank;
using Bank.MobileUI.Helpers;

namespace Bank.MobileUI;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .UseMauiCommunityToolkit()
            .UseBarcodeReader()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

        // 1. Configuração de API
        builder.Services.AddRefitClient<IBankingApi>()
               .ConfigureHttpClient(c => c.BaseAddress = new Uri(Constants.BaseUrl));

        // 2. Infraestrutura
        builder.Services.AddSingleton<BaseRepository<LocalTransaction>>();
        builder.Services.AddSingleton<IBalanceRepository, BalanceRepository>();
        builder.Services.AddSingleton<IWalletService, Web3WalletService>(); 
        builder.Services.AddSingleton<ISwapService, SwapService>();
        builder.Services.AddSingleton<StakingContractService>();

        // 3. ViewModels
        builder.Services.AddTransient<DashboardViewModel>();
        builder.Services.AddTransient<TransactionsViewModel>();
        builder.Services.AddTransient<TransferViewModel>();
        builder.Services.AddTransient<SwapViewModel>();
        builder.Services.AddTransient<StakingViewModel>();

        // --- CORREÇÃO AQUI: Onboarding ViewModels ---
        // Usamos o namespace completo para evitar ambiguidade
        builder.Services.AddTransient<Bank.MobileUI.ViewModels.WelcomeViewModel>();
        builder.Services.AddTransient<Bank.MobileUI.ViewModels.Onboarding.ImportWalletViewModel>();

        // 4. Pages (Views)
        builder.Services.AddTransient<DashboardPage>();
        builder.Services.AddTransient<HistoryPage>();
        builder.Services.AddTransient<TransferPage>();
        builder.Services.AddTransient<ScanPage>();
        builder.Services.AddTransient<SwapPage>();
        builder.Services.AddTransient<StakingPage>();
        builder.Services.AddTransient<BuyCryptoPage>();
        builder.Services.AddTransient<LoadingPage>();
        
        // --- Views de Onboarding ---
        builder.Services.AddTransient<WelcomePage>();
        builder.Services.AddTransient<ImportWalletPage>();

        // 5. Rotas
        Routing.RegisterRoute(nameof(ImportWalletPage), typeof(ImportWalletPage));
        Routing.RegisterRoute(nameof(TransferPage), typeof(TransferPage));
        Routing.RegisterRoute(nameof(ScanPage), typeof(ScanPage));
        Routing.RegisterRoute(nameof(BuyCryptoPage), typeof(BuyCryptoPage));

#if DEBUG
        builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}