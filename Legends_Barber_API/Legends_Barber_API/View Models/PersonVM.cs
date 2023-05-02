namespace Legends_Barber_API.View_Models
{
    public class PersonVM
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Surname { get; set; } = null!;

        public string? PhoneNumber { get; set; }

        public string? Email { get; set; }

        public string? Username { get; set; }

        public string? Password { get; set; }

        public int? UserType { get; set; }
    }
}
