using System;
using Bank.Domain.Interfaces;
using Bank.Infrastructure.Api;
using Bank.MobileUI.Models; // Namespace sugerido para o DTO de resposta

namespace Bank.MobileUI.Views.Fiat;

public partial class BuyCryptoPage : ContentPage
{
    // 1. Tipagem Forte: Usamos as interfaces, não 'object'
    private readonly IBankingApi _bankingApi;
    private readonly IWalletService _walletService;

    // 2. Injeção de Dependência: O MAUI injeta automaticamente essas implementações
    public BuyCryptoPage(IBankingApi bankingApi, IWalletService walletService)
    {
        InitializeComponent();
        _bankingApi = bankingApi;
        _walletService = walletService;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        try
        {
            // 3. Obtém o endereço da carteira corretamente
            string address = await _walletService.GetOrCreateWalletAsync();

            // 4. Chama a API tipada (precisa atualizar a Interface IBankingApi, veja abaixo)
            var response = await _bankingApi.GetMoonPayUrlAsync(address);
            
            // Define a URL no WebView
            GatewayWebView.Source = response.Url;
        }
        catch (Exception ex)
        {
            await DisplayAlert("Erro", "Não foi possível carregar o provedor de pagamento.", "OK");
            // Logar erro...
        }
    }

    private void OnWebViewNavigating(object? sender, WebNavigatingEventArgs e)
    {
        // Implementação básica para evitar o Crash do NotImplementedException
        // Aqui você pode bloquear URLs que não sejam do MoonPay por segurança
        if (e.Url.StartsWith("http")) 
        {
            // Lógica de segurança opcional
        }
    }
}