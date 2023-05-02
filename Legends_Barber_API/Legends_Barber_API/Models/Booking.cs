using System;
using System.Collections.Generic;

namespace Legends_Barber_API.Models;

public partial class Booking
{
    public int BookingId { get; set; }

    public DateTime? BookingDate { get; set; }

    public int? ShopId { get; set; }

    public int? PersonId { get; set; }

    public virtual Person? Person { get; set; }

    public virtual Shop? Shop { get; set; }
}
