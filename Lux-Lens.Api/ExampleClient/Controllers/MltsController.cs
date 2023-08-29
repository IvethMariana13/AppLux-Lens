using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ExampleClient.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MltsController : ControllerBase
    {
        private readonly IHttpClientFactory _httpClientFactory;

        public MltsController(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        [HttpGet]
        public async Task<IActionResult> GetLoginInfo()
        {
            var model = new LoginViewModel
            {
                UserName = "user@example.com",
                Password = "P@sw0rd1"
            };

            var client = _httpClientFactory.CreateClient();

            // Configura el handler y otras configuraciones necesarias en el cliente aquí

            var response = await client.GetAsync("https://localhost:44326/api/Login/" + model);
            var responseBody = await response.Content.ReadAsStringAsync();

            return Ok(new { StatusCode = response.StatusCode, ResponseBody = responseBody });
        }
    }
}
