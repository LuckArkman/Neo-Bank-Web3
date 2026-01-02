using Bank.MobileUI.Views.Onboarding;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using Application = Microsoft.Maui.Controls.Application;

namespace Bank.MobileUI;

public partial class App : Microsoft.Maui.Controls.Application
{
    private readonly IServiceProvider _services;

    public App(IServiceProvider services)
    {
        InitializeComponent();
        _services = services;
        // --- ADICIONE ISTO PARA TESTAR O ONBOARDING ---
        // Remove todos os dados salvos para simular uma instalação limpa
         SecureStorage.Default.RemoveAll();
         Preferences.Clear();
        // ----------------------------------------------
    }

    protected override Window CreateWindow(IActivationState? activationState)
    {
        // 1. Cria a LoadingPage imediatamente (Síncrono)
        // Isso impede o crash "No page was set on the window"
        var loadingPage = new LoadingPage();

        // 2. Define ela na janela
        var window = new Window(loadingPage);

        // 3. Inicia a verificação em background para trocar a tela depois
        InitializeNavigation(window);

        return window;
    }

    private async void InitializeNavigation(Window window)
    {
        try
        {
            // Simula um pequeno delay se o SecureStorage for rápido demais, 
            // para evitar "flicker" na tela (opcional)
            // await Task.Delay(500); 

            // Verifica login
            string key = await SecureStorage.Default.GetAsync("user_private_key");
            bool isFirstRun = Preferences.Get("is_first_run", true);

            // IMPORTANTE: Toda alteração de UI deve ser na MainThread
            MainThread.BeginInvokeOnMainThread(() =>
            {
                if (isFirstRun)
                {
                    Preferences.Set("is_first_run", false);
                    window.Page = _services.GetRequiredService<OnboardingPage>();
                }
                else if (!string.IsNullOrEmpty(key))
                {
                    // Usuário Logado -> Dashboard
                    window.Page = new AppShell();
                }
                else
                {
                    // Usuário sem conta -> Welcome
                    window.Page = _services.GetRequiredService<WelcomePage>();
                }
            });
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Erro crítico na navegação: {ex.Message}");
            // Fallback seguro
            MainThread.BeginInvokeOnMainThread(() => 
            {
                window.Page = _services.GetRequiredService<WelcomePage>();
            });
        }
    }
    
    // Mantemos a lógica de Deep Link
    protected override async void OnAppLinkRequestReceived(Uri uri)
    {
        base.OnAppLinkRequestReceived(uri);

        if (uri.Scheme.Equals("neobank", StringComparison.OrdinalIgnoreCase) && 
            uri.Host.Equals("pay", StringComparison.OrdinalIgnoreCase))
        {
            var query = System.Web.HttpUtility.ParseQueryString(uri.Query);
            string to = query.Get("to");
            string amount = query.Get("amount");

            // Se o AppShell já estiver carregado, navega. 
            // Se estiver no WelcomePage, isso será ignorado por segurança.
            if (MainPage is AppShell)
            {
                await Shell.Current.GoToAsync($"//TransferPage?toAddress={to}&amount={amount}");
            }
        }
    }
}