using Bank.Domain.Entities;
using Microsoft.AspNetCore.SignalR.Client;
using Microsoft.Extensions.DependencyInjection;
using Bank.Domain.Interfaces;

namespace Bank.Infrastructure.Services
{
    public class RealTimeService : IAsyncDisposable
    {
        private HubConnection? _hubConnection;
        public event Action<decimal>? OnMoneyReceived;

        public async Task ConnectAsync(string walletAddress)
        {
            _hubConnection = new HubConnectionBuilder()
                .WithUrl("https://meu-backend.com/bankingHub")
                .WithAutomaticReconnect()
                .Build();

            _hubConnection.On<TransactionAlert>("ReceiveTransactionAlert", (alert) =>
            {
                OnMoneyReceived?.Invoke(alert.Amount);
            });

            await _hubConnection.StartAsync();
            await _hubConnection.InvokeAsync("JoinWalletGroup", walletAddress);
        }

        public async ValueTask DisposeAsync()
        {
            if (_hubConnection is not null)
            {
                await _hubConnection.DisposeAsync();
            }
        }
    }
}