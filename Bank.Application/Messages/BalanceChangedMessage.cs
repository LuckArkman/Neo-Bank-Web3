using CommunityToolkit.Mvvm.Messaging.Messages;

namespace Bank.Application.Messages;

// Mensagem simples para notificar mudança de saldo
public class BalanceChangedMessage : ValueChangedMessage<decimal>
{
    public BalanceChangedMessage(decimal newBalance) : base(newBalance) { }
}