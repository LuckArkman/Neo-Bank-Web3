using Bank.Backend.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

app.MapGet("/api/transactions/{address}", (string address) =>
    {
        // Mock para o MVP - Aqui viria do Banco de Dados preenchido pelo Worker
        var history = new List<TransactionRecord>
        {
            new("0x123...", "0xWm...User", "0xTarget...", 150.50m, DateTime.UtcNow.AddMinutes(-10), "Transfer"),
            new("0x456...", "0xExchange...", "0xWm...User", 1000.00m, DateTime.UtcNow.AddDays(-1), "Deposit"),
            new("0x789...", "0xWm...User", "0xLidoStake", 500.00m, DateTime.UtcNow.AddDays(-5), "Stake")
        };

        return Results.Ok(history);
    })
    .WithName("GetTransactions");

app.Run();