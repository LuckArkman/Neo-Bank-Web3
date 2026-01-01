using Bank.Domain.Entities;

namespace Bank.Domain.Interfaces;

public interface IBalanceRepository
{
    /// <summary>
    /// Retorna a lista de ativos salvos localmente (Cache).
    /// </summary>
    Task<List<Asset>> GetPortfolioAsync();

    /// <summary>
    /// Salva ou atualiza a lista de ativos no banco local.
    /// Útil para cachear o resultado da API/Blockchain.
    /// </summary>
    Task SavePortfolioAsync(IEnumerable<Asset> assets);

    /// <summary>
    /// Retorna o saldo total somado em USD.
    /// </summary>
    Task<decimal> GetTotalBalanceInUsdAsync();

    Task<decimal> GetBalanceFromDbAsync(string walletAddress);
}