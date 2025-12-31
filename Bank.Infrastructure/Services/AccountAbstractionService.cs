using System.Net.Http.Json;
using Bank.Domain.Web3;

namespace Bank.Infrastructure.Services;

public class AccountAbstractionService
{
    private readonly HttpClient _httpClient;
    private readonly string _bundlerUrl = "https://api.stackup.sh/v1/node/YOUR_API_KEY";

    public AccountAbstractionService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<string> SendUserOpAsync(UserOperation userOp)
    {
        // 1. Serializa a UserOp para JSON-RPC
        var payload = new
        {
            jsonrpc = "2.0",
            id = 1,
            method = "eth_sendUserOperation",
            @params = new object[] 
            { 
                userOp, 
                "0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789" // EntryPoint Address (Padrão ERC-4337)
            }
        };

        // 2. Envia para o Bundler
        var response = await _httpClient.PostAsJsonAsync(_bundlerUrl, payload);
        response.EnsureSuccessStatusCode();

        // 3. Retorna o Hash da UserOp
        var result = await response.Content.ReadAsStringAsync();
        return result; 
    }
}