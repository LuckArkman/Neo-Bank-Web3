using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bank.MobileUI.ViewModels;

namespace Bank.MobileUI.Views.Onboarding;

public partial class WelcomePage : ContentPage
{
    public WelcomePage(WelcomeViewModel vm)
    {
        InitializeComponent();
        
        // Esta linha conecta o XAML (Botão) ao C# (Comando)
        BindingContext = vm; 
    }
    
    private void OnTestClicked(object sender, EventArgs e)
    {
        Debug.WriteLine(">>> [DEBUG] O BOTÃO FOI CLICADO FISICAMENTE!");
    
        // Se o Command não funcionar, forçamos a navegação aqui para testar
        if (BindingContext is WelcomeViewModel vm)
        {
            vm.GoToImportCommand.Execute(null);
        }
    }
}