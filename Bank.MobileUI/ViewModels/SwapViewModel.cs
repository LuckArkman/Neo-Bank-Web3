using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Bank.Domain.Interfaces;

namespace Bank.MobileUI.ViewModels;

public partial class SwapViewModel : ObservableObject
{
    private readonly ISwapService _swapService;

    [ObservableProperty] private string fromToken = "ETH";
    [ObservableProperty] private string toToken = "USDC";
    [ObservableProperty] private decimal amountIn;
    [ObservableProperty] private decimal estimatedOut;
    [ObservableProperty] private bool needsApproval; // UI State para botão "Aprovar" vs "Trocar"

    public SwapViewModel(ISwapService swapService)
    {
        _swapService = swapService;
    }

    // Chamado sempre que o usuário digita o valor
    partial void OnAmountInChanged(decimal value)
    {
        if (value > 0) UpdateQuoteCommand.Execute(null);
    }

    [RelayCommand]
    private async Task UpdateQuoteAsync()
    {
        var quote = await _swapService.GetQuoteAsync(FromToken, ToToken, AmountIn);
        EstimatedOut = quote.EstimatedOutput;
        
        // Lógica simplificada: Se for token ERC20 (não nativo), precisa aprovar
        NeedsApproval = FromToken != "ETH"; 
    }

    [RelayCommand]
    private async Task ExecuteActionAsync()
    {
        if (NeedsApproval)
        {
            await _swapService.ApproveTokenAsync("0xTokenAddress", AmountIn);
            NeedsApproval = false; // Agora pode trocar
            await Shell.Current.DisplayAlert("Aprovado", "Token liberado para troca.", "OK");
        }
        else
        {
            await _swapService.ExecuteSwapAsync(FromToken, ToToken, AmountIn, EstimatedOut * 0.99m); // 1% slippage
            await Shell.Current.DisplayAlert("Sucesso", "Swap realizado! Seus novos tokens chegarão em breve.", "OK");
        }
    }
}