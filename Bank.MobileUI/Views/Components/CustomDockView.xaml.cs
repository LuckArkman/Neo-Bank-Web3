using System.Windows.Input;

namespace Bank.MobileUI.Views.Components;

public partial class CustomDockView : ContentView
{
    public ICommand NavigateCommand { get; private set; }

    public CustomDockView()
    {
        InitializeComponent();
        
        // Comando simples para navegar via Shell
        NavigateCommand = new Command<string>(async (route) =>
        {
            if (!string.IsNullOrEmpty(route))
            {
                await Shell.Current.GoToAsync(route);
            }
        });

        // Define o contexto de binding para si mesmo para acessar o comando no XAML
        BindingContext = this;
    }
}