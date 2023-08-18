using Lux_Lens.ApplicationServices.Lens;
using Lux_Lens.Core.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LuxLens.Api.Controllers.LensControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LensController : ControllerBase
    {
        private readonly ILensService _lensService;

        public LensController(ILensService llensService)
        {
            _lensService = llensService;
        }
        
        [HttpPost("Create")]
        public async Task<Int32> Create(Lens dto)
        {
            
             var response = await _lensService.AddLensAsync(dto);
             
            return response;
        }

        [HttpPost("Delete")]
        public async Task delete(int id)
        {
             await _lensService.DeleteLensAsync(id);
        }

        [HttpPost("GetAll")]
        public async Task Getall()
        {
            await _lensService.GetLensAsync();
        }

    }
}
