using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bank.Domain.Entities
{
    public class Asset
    {
        public string Symbol { get; set; } // EX: ETH, MATIC
        public string Name { get; set; }
        public decimal Balance { get; set; }
        public decimal UsdValue { get; set; }
        public string LogoUrl { get; set; }
    }
    
}
