using Microsoft.AspNetCore.SignalR;
using Nethereum.Web3;
using Org.BouncyCastle.Tls.Crypto;
using System.Numerics;

public class BlockchainIndexer : BackgroundService
{
    private readonly ILogger<BlockchainIndexer> _logger;

    private readonly Web3 _web3 = new Web3("https://polygon-rpc.com");
    private BigInteger _lastBlockChecked = 0;

    public BlockchainIndexer(ILogger<BlockchainIndexer> logger)
    {
        _logger = logger;
        //await _logger.Clients.Group(toAddress.ToLower()).SendAsync("ReceiveTransactionAlert", new { Amount = amount, Hash = txHash });
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while (!stoppingToken.IsCancellationRequested)
        {
            try
            {
                var latestBlock = await _web3.Eth.Blocks.GetBlockNumber.SendRequestAsync();
                
                if (_lastBlockChecked == 0) _lastBlockChecked = latestBlock.Value - 10; // Começa 10 blocos atrás

                if (latestBlock.Value > _lastBlockChecked)
                {
                    // Lógica simplificada: buscaria logs de eventos Transfer(from, to, value)
                    // Aqui processamos do bloco _lastBlockChecked até latestBlock
                    _logger.LogInformation($"Indexando blocos {_lastBlockChecked} até {latestBlock.Value}...");

                    // TODO: Salvar eventos encontrados no Banco de Dados
                    
                    _lastBlockChecked = latestBlock.Value;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Erro ao indexar blockchain");
            }

            // Aguarda 5 segundos antes da próxima verificação (Polling)
            await Task.Delay(5000, stoppingToken);
        }
    }
}