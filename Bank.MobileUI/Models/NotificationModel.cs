using CommunityToolkit.Mvvm.ComponentModel;

namespace Bank.MobileUI.Models;

public class NotificationModel : ObservableObject
{
    public string Title { get; set; }
    public string Message { get; set; }
    public string Time { get; set; }
    public string Type { get; set; } // Transfer, Security, Promo
    
    private bool _isRead;
    public bool IsRead { get => _isRead; set { SetProperty(ref _isRead, value); OnPropertyChanged(nameof(IsUnread)); } }
    public bool IsUnread => !IsRead;
}