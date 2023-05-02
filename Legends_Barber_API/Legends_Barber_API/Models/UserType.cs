using System;
using System.Collections.Generic;

namespace Legends_Barber_API.Models;

public partial class UserType
{
    public int Id { get; set; }

    public string? TypeName { get; set; }

    public virtual ICollection<Person> People { get; set; } = new List<Person>();
}
