using System.Numerics;
using Nethereum.ABI.FunctionEncoding.Attributes;
using Nethereum.Contracts;

namespace Bank.Application.Messages;

[Function("stake")] 
public class StakeFunction : FunctionMessage
{
    [Parameter("uint256", "amount", 1)]
    public BigInteger Amount { get; set; }
}