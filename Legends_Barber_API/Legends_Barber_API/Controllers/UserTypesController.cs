using Legends_Barber_API.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Legends_Barber_API.Controllers
{
    [Route("api/usertypes")]
    [ApiController]
    public class UserTypesController : ControllerBase
    {
        LegendsBarbershopDbContext db = new LegendsBarbershopDbContext();
        [Route("GetUserType")]
        [HttpGet]
        public List<UserType> GetUserType()
        {
            // db.Configuration.ProxyCreationEnabled = false;
            return db.UserTypes.Select(zz => new UserType
            {
               Id = zz.Id,
               TypeName = zz.TypeName
              
            }).ToList();
        }


        //Get User Type By ID
        [Route("GetUserTypeByID/{id:int}")]
        [HttpGet]
        public object GetUserTypeByID(int id)
        {

            // db.Configuration.ProxyCreationEnabled = false;


            UserType cus = db.UserTypes.Find(id);
            if (cus == null)
            {
                return NotFound();
            }
            return cus;

        }


        //Add: User Type
       

        // POST api/<UserTypesController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<UserTypesController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<UserTypesController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
