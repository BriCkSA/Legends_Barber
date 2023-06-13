using Microsoft.AspNetCore.Mvc;
using Legends_Barber_API.Models;
using Legends_Barber_API.View_Models;



// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Legends_Barber_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonsController : ControllerBase
    {

        LegendsBarbershopDbContext db = new LegendsBarbershopDbContext();
        [Route("GetPersonByPhoneNumber/{number:int}")]
        [HttpGet]
        public ResponseObject GetPersonByPhoneNumber(int number)
        {
            // db.Configuration.ProxyCreationEnabled = false;
            var responseObject = new ResponseObject();
            try {
                var person = db.People.Where(zz => zz.PhoneNumber == "0"+number).Select(zz => new PersonVM
                {
                    PhoneNumber = zz.PhoneNumber,
                    Name = zz.Name,
                    Email = zz.Email,
                    Surname = zz.Surname,
                    Id = zz.Id
                }).FirstOrDefault();

                if (person != null)
                {
                    responseObject.status = 200;
                    responseObject.Data = person;
                    responseObject.message = "Success";
             
                }
                else {

                    responseObject.status = 100;
                    responseObject.message = "No Person Found";
                }


            }
            catch (Exception e)
            {
            
            responseObject.status = 500;
            responseObject.message = e.Message;

            }


            return responseObject;
        }

          [Route("CreatePerson")]

         [HttpPost]
         public ResponseObject CreatePerson([FromBody] PersonVM person)
         {
             //db.Configuration.ProxyCreationEnabled = false;
           var response = new ResponseObject();
           Person newPerson = new Person
             {
               Name = person.Name,
               Surname = person.Surname,
               Email = person.Email,
               PhoneNumber  = person.PhoneNumber,

             };

       

            try
             {
                 db.People.Add(newPerson);
                 db.SaveChanges();

                Booking newBooking = new Booking
                {
                    BookingDate = DateTime.Now,
                    PersonId = newPerson.Id,

                };
                db.Bookings.Add(newBooking);
                db.SaveChanges();

                response.status = 200;
                response.message = "Success";
                response.Data = newPerson.Id;
             }
             catch (Exception e)
             {
                response.status = 500;
                response.message = e.Message;
             }

            return response;
         }


        // GET api/<PersonsController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<PersonsController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<PersonsController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<PersonsController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
