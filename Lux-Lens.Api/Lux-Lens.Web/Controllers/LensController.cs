using Lux_Lens.Web.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Lux_Lens.Web.Controllers
{
    [ApiController]
    [Route("[controller]")]
    
    public class LensController : ControllerBase
    {
        private readonly IHttpClientFactory _httpClientFactory;

        public LensController(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllAsync()
        {
            var httpClient = _httpClientFactory.CreateClient();

            HttpResponseMessage response = await httpClient.GetAsync("https://localhost:44326/api/Lens/GetAll");

            if(response.IsSuccessStatusCode)
            {
                var contentStream = await response.Content.ReadAsStreamAsync();
                var options = new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true,
                };

                var items = await JsonSerializer.DeserializeAsync<List<LensViewModel>>(contentStream, options);

                return Ok(items);
            }
            else
            {
                Console.WriteLine("No entró a la api");
                return StatusCode((int)response.StatusCode, response.ReasonPhrase);
            }
        }
    }
}
