using System.Globalization;

namespace Bank.MobileUI.Converters;

public class ReadBackgroundConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        // Se não lido (IsUnread = true), fundo levemente roxo/cinza. Se lido, branco.
        return (bool)value ? Colors.White : Color.FromArgb("#F8F9FB"); // Lógica invertida baseada no nome IsRead
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => throw new NotImplementedException();
}

public class NotificationColorConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        string type = value?.ToString() ?? "";
        return type switch
        {
            "Transfer" => Color.FromArgb("#3498DB"), // Azul
            "Security" => Color.FromArgb("#E74C3C"), // Vermelho
            "Promo" => Color.FromArgb("#8E44AD"),    // Roxo
            _ => Color.FromArgb("#95A5A6")           // Cinza
        };
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => throw new NotImplementedException();
}

public class NotificationIconConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        string type = value?.ToString() ?? "";
        return type switch
        {
            "Transfer" => "💸",
            "Security" => "🛡️",
            "Promo" => "🎁",
            _ => "🔔"
        };
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => throw new NotImplementedException();
}