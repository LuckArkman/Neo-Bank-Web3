using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bank.MobileUI.ViewModels;

namespace Bank.MobileUI.Views;

public partial class SwapPage : ContentPage
{
    public SwapPage(SwapViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }

    // Opcional: Animação simples ao aparecer
    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await this.FadeTo(1, 500);
    }
}