using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bank.Domain.Entities;
using Bank.MobileUI.ViewModels;
using CommunityToolkit.Mvvm.Input;

namespace Bank.MobileUI.Views;

public partial class DashboardPage : ContentPage
{
    public DashboardPage(DashboardViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }

    private async void ContentPage_Appearing(object sender, EventArgs e)
    {
        if (BindingContext is DashboardViewModel vm)
        {
            await vm.LoadDataAsync();
        }
    }
}