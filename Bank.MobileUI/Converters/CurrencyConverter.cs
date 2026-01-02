using System.Globalization;

namespace Bank.MobileUI.Converters;

public class CurrencyConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        if (value is decimal decimalValue)
        {
            if (parameter is string tokenSymbol && tokenSymbol == "ETH")
            {
                // Divide para transformar os últimos 4 dígitos em decimais
                decimal valorFinal = decimalValue / 10000m; 

                // "0.####" exibe até 4 casas decimais apenas se elas existirem
                // e evita o arredondamento automático para cima em alguns casos
                return $"{valorFinal:0.####} {tokenSymbol}";
            }
        
            return decimalValue.ToString("C", culture);
        }
        return "0";
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => throw new NotImplementedException();
}