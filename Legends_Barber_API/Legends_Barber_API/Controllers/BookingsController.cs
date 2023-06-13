using Legends_Barber_API.Models;
using Legends_Barber_API.View_Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Legends_Barber_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingsController : ControllerBase
    {
        LegendsBarbershopDbContext db = new LegendsBarbershopDbContext();
        [Route("GetBookings")]
        [HttpGet]
        public List<BookingVM> GetBookings()
        {
            // db.Configuration.ProxyCreationEnabled = false;
            return db.Bookings.Select(b => new BookingVM
            {
              BookingDate = b.BookingDate,
              BookingId = b.BookingId,
              Person = db.People.Where(p => p.Id == b.PersonId).FirstOrDefault()

            }).ToList();
        }
    }
}
