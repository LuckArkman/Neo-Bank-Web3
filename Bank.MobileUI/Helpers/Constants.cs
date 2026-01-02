namespace Bank.MobileUI.Helpers;

public static class Constants
{
    // Android Emulator usa 10.0.2.2 para acessar o localhost da máquina host
    // Device físico usa o IP da sua máquina na rede local (ex: 192.168.x.x)
    public static string BaseUrl = DeviceInfo.Platform == DevicePlatform.Android 
        ? "http://10.0.2.2:5000" 
        : "http://localhost:5000";

    public const string RpcUrl = "https://polygon-rpc.com";
    public const string MoonPayBaseUrl = "https://buy.moonpay.com";
}