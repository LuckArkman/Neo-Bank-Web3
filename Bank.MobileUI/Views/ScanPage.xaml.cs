using ZXing.Net.Maui;

namespace Bank.MobileUI.Views;

public partial class ScanPage : ContentPage
{
    public ScanPage()
    {
        InitializeComponent();
        // Configurações da câmera
        barcodeReader.Options = new BarcodeReaderOptions
        {
            //Formats = BarcodeFormats.QrCode,
            AutoRotate = true,
            Multiple = false
        };
    }

    private void CameraBarcodeReaderView_BarcodesDetected(object sender, BarcodeDetectionEventArgs e)
    {
        var firstResult = e.Results?.FirstOrDefault();
        if (firstResult is null) return;

        MainThread.BeginInvokeOnMainThread(async () =>
        {
            // Para a câmera
            barcodeReader.IsDetecting = false;
            
            string address = firstResult.Value;
            
            // Validação básica de endereço ETH (começa com 0x e tem 42 chars)
            if(!address.StartsWith("0x") || address.Length != 42)
            {
                await DisplayAlert("Erro", "QR Code não é um endereço válido.", "OK");
                barcodeReader.IsDetecting = true;
                return;
            }

            // Volta para a tela de transferência passando o endereço lido
            await Shell.Current.GoToAsync($"..?toAddress={address}");
        });
    }
}