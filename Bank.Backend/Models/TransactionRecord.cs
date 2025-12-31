namespace Bank.Backend.Models;

public record TransactionRecord(
    string Hash, 
    string From, 
    string To, 
    decimal Amount, 
    DateTime Timestamp, 
    string Type // "Transfer", "Stake", "Swap"
);