using Nethereum.Hex.HexTypes;

namespace Bank.Domain.Web3;

public class UserOperation
{
    public string Sender { get; set; }
    public string Nonce { get; set; }
    public string InitCode { get; set; } = "0x";
    public string CallData { get; set; }
    public HexBigInteger CallGasLimit { get; set; }
    public HexBigInteger VerificationGasLimit { get; set; }
    public HexBigInteger PreVerificationGas { get; set; }
    public HexBigInteger MaxFeePerGas { get; set; }
    public HexBigInteger MaxPriorityFeePerGas { get; set; }
    public string PaymasterAndData { get; set; } = "0x"; // Aqui acontece a mágica do patrocínio
    public string Signature { get; set; }
}