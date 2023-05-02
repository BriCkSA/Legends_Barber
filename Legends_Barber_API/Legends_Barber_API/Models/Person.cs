using System;
using System.Collections.Generic;

namespace Legends_Barber_API.Models;

public partial class Person
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public string? PhoneNumber { get; set; }

    public string? Email { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public int? UserType { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();

    public virtual UserType? UserTypeNavigation { get; set; }
}
