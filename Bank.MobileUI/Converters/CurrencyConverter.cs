using System.Globalization;

namespace Bank.MobileUI.Converters;

public class CurrencyConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        if (value is decimal decimalValue)
        {
            // Formata baseado na cultura do dispositivo (R$ ou $)
            // Se for cripto (parametro 'ETH'), usa mais casas decimais
            if (parameter is string tokenSymbol && tokenSymbol != "USD" && tokenSymbol != "BRL")
            {
                return $"{decimalValue:0.####} {tokenSymbol}";
            }
            
            return decimalValue.ToString("C", culture);
        }
        return "0.00";
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => throw new NotImplementedException();
}