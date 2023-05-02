using System;
using System.Collections.Generic;

namespace Legends_Barber_API.Models;

public partial class Shop
{
    public int ShopId { get; set; }

    public string? ShopName { get; set; }

    public int? ShopProv { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();

    public virtual Province? ShopProvNavigation { get; set; }
}
