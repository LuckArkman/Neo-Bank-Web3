using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bank.Domain.Interfaces
{
    public interface IWalletService
    {
        Task<string> GetOrCreateWalletAsync(); // Retorna o endereço 0x...
        Task<decimal> GetNativeBalanceAsync(string address);
        Task<string> SendTransactionAsync(string toAddress, decimal amount);
        Task<bool> StakeAssetAsync(decimal amount); // Função de Staking
    }
}
