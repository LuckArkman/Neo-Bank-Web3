using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using Bank.MobileUI.Models;

namespace Bank.MobileUI.ViewModels;

public partial class NotificationViewModel : ObservableObject
{
    public ObservableCollection<NotificationModel> Notifications { get; } = new();

    public NotificationViewModel()
    {
        LoadNotifications();
    }

    private void LoadNotifications()
    {
        // Mock de dados vindos do Backend
        Notifications.Add(new NotificationModel { Title = "Transferência Recebida", Message = "Você recebeu 0.5 ETH de João.", Time = "2 min atrás", Type = "Transfer", IsRead = false });
        Notifications.Add(new NotificationModel { Title = "Alerta de Segurança", Message = "Novo login detectado em São Paulo.", Time = "1 hora atrás", Type = "Security", IsRead = true });
        Notifications.Add(new NotificationModel { Title = "Cashback Disponível", Message = "Resgate seus pontos agora.", Time = "ontem", Type = "Promo", IsRead = true });
    }

    [RelayCommand]
    private async Task NotificationTappedAsync(NotificationModel notification)
    {
        if (!notification.IsRead)
        {
            notification.IsRead = true; // Atualiza UI
            // TODO: Chamar API para marcar como lido
        }
        await Shell.Current.DisplayAlert("Detalhes", notification.Message, "OK");
    }
}