using Lux_Lens.ApplicationServices.Lens;
using Lux_Lens.Core.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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

        [HttpGet("GetById/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var lens = await _lensService.GetLensByIdAsync(id);

            if (lens == null)
            {
                return NotFound();
            }

            return Ok(lens);
        }

        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAllLenses()
        {
            var lenses = await _lensService.GetLensAsync();
            return Ok(lenses);
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(Lens lens)
        {

            var response = await _lensService.AddLensAsync(lens);

            if (response != null)
            {
                return Ok(new { Message = "¡Lente creado exitosamente!", Lens = response });
            }
            else
            {
                return BadRequest(new { Message = "Hubo un problema al crear el lente." });
            }
        }

        [HttpPut("Edit/{id}")]
        public async Task<IActionResult> EditLens(int id, Lens lens)
        {
            if (id != lens.Id)
            {
                return BadRequest();
            }

            await _lensService.EditLensAsync(lens);
            return NoContent();
        }

        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> DeleteLens(int id)
        {
            await _lensService.DeleteLensAsync(id);
            return Ok();
        }

        

    }
}
