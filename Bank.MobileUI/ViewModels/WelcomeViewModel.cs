using System.Diagnostics;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Bank.Domain.Interfaces;
using Bank.MobileUI; 
using Bank.MobileUI.Views.Onboarding;
using Microsoft.Maui.Controls;
using Microsoft.Maui; 

namespace Bank.MobileUI.ViewModels;

public partial class WelcomeViewModel : ObservableObject
{
    private readonly IWalletService _walletService;
    private readonly IServiceProvider _services;

    [ObservableProperty]
    private bool _isBusy;

    public WelcomeViewModel(IWalletService walletService, IServiceProvider services)
    {
        _walletService = walletService;
        _services = services;
        System.Diagnostics.Debug.WriteLine(">>> [DEBUG] WelcomeViewModel Construtor executado.");
    }

    [RelayCommand]
    private async Task CreateWalletAsync()
    {
        if (IsBusy) return;
        IsBusy = true;
        try
        {
            System.Diagnostics.Debug.WriteLine(">>> [DEBUG] Criar Carteira iniciado.");
            string address = await _walletService.GetOrCreateWalletAsync();
            NavigateToRoot(new AppShell());
        }
        catch (Exception ex)
        {
            Debug.WriteLine($">>> [DEBUG] Erro ao criar: {ex.Message}");
        }
        finally
        {
            IsBusy = false;
        }
    }

    [RelayCommand]
    private void GoToImport()
    {
        Debug.WriteLine(">>> [DEBUG] Botão 'Já tenho carteira' CLICADO.");

        try 
        {
            // Tenta resolver a página
            var importPage = _services.GetRequiredService<ImportWalletPage>();
            Debug.WriteLine($">>> [DEBUG] Página ImportWalletPage resolvida: {importPage != null}");
            
            NavigateToRoot(importPage);
        }
        catch (Exception ex)
        {
            Debug.WriteLine($">>> [DEBUG] ERRO FATAL no GoToImport: {ex}");
        }
    }

    private void NavigateToRoot(Page newPage)
    {
        Debug.WriteLine(">>> [DEBUG] NavigateToRoot chamado.");

        var app = Microsoft.Maui.Controls.Application.Current;

        if (app == null)
        {
            Debug.WriteLine(">>> [DEBUG] Application.Current é NULL. Tentando recuperar via Services...");
            app = _services.GetService<IApplication>() as Microsoft.Maui.Controls.Application;
        }

        if (app != null)
        {
            Debug.WriteLine(">>> [DEBUG] App encontrado. Tentando trocar MainPage na MainThread...");
            
            MainThread.BeginInvokeOnMainThread(() =>
            {
                try
                {
                    app.MainPage = newPage;
                    Debug.WriteLine(">>> [DEBUG] SUCESSO: MainPage trocada.");
                }
                catch(Exception ex)
                {
                     Debug.WriteLine($">>> [DEBUG] ERRO ao trocar MainPage: {ex}");
                }
            });
        }
        else
        {
            Debug.WriteLine(">>> [DEBUG] FALHA CRÍTICA: Não foi possível encontrar a instância da App (nem via Current, nem via Services).");
        }
    }
}