using System.Globalization;

namespace Bank.MobileUI.Converters;

public class PriceColorConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        if (value is decimal price)
        {
            // Verde para valores positivos (+), Preto/Cinza para negativos (-)
            return price > 0 ? Color.FromArgb("#2ECC71") : Color.FromArgb("#2C3E50");
        }
        return Colors.Black;
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}