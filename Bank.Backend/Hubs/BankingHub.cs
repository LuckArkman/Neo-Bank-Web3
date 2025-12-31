using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using NBitcoin.Secp256k1;

namespace Bank.Backend.Hubs
{
    public class BankingHub : Hub
    {
        private object _secretKey;

        public BankingHub(object secretKey)
        {
            _secretKey = secretKey;
        }

        public async Task JoinWalletGroup(string walletAddress)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, walletAddress.ToLower());
        }
        
        [HttpGet("moonpay-url")]
        public IActionResult GetSignedUrl(string userWalletAddress)
        {
            var originalUrl = $"https://buy.moonpay.com?apiKey=minha_pk&currencyCode=ETH&walletAddress={userWalletAddress}";
    
            // Assinar a URL com HMAC-SHA256 usando a Secret Key (que fica só no servidor)
            var signature = SignUrl(originalUrl, _secretKey);
            return null;
            //return Ok($"{originalUrl}&signature={signature}");
        }

        private object SignUrl(string originalUrl, object secretKey)
        {
            throw new NotImplementedException();
        }
    }
}
