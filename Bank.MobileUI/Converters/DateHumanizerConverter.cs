using System.Globalization;

namespace Bank.MobileUI.Converters;

public class DateHumanizerConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        if (value is DateTime date)
        {
            var localDate = date.ToLocalTime();
            if (localDate.Date == DateTime.Today) return "Hoje";
            if (localDate.Date == DateTime.Today.AddDays(-1)) return "Ontem";
            return localDate.ToString("dd MMM, HH:mm");
        }
        return "";
    }

    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        return null;
    }
}