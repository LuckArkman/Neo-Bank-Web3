using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bank.MobileUI.Views.Fiat;

public partial class BuyCryptoPage : ContentPage
{
    private object _bankingApi;

    public BuyCryptoPage(object bankingApi)
    {
        _bankingApi = bankingApi;
        InitializeComponent();
    }

    private void OnWebViewNavigating(object? sender, WebNavigatingEventArgs e)
    {
        throw new NotImplementedException();
    }
    protected override async void OnAppearing()
    {
        base.OnAppearing();
        // Pede ao backend a URL segura
        var secureUrl = await _bankingApi.GetMoonPayUrlAsync(_walletService.Address);
        GatewayWebView.Source = secureUrl;
    }
}