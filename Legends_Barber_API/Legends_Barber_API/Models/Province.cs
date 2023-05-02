using System;
using System.Collections.Generic;

namespace Legends_Barber_API.Models;

public partial class Province
{
    public int ProvId { get; set; }

    public string ProvName { get; set; } = null!;

    public virtual ICollection<Shop> Shops { get; set; } = new List<Shop>();
}
