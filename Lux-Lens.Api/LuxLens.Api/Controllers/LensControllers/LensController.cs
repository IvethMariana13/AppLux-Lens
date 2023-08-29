﻿using Lux_Lens.ApplicationServices.Lens;
using Lux_Lens.AppServices.Shared.Dto;
using Lux_Lens.Core.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LuxLens.Api.Controllers.LensControllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class LensController : ControllerBase
    {
        private readonly ILensService _lensService;

        public LensController(ILensService llensService)
        {
            _lensService = llensService;
        }

        [HttpGet("GetById/{id}")]
        [Authorize(Roles = "Admin, Rol Read")]
        public async Task<Lens> GetById(int id)
        {
            return await _lensService.GetLensByIdAsync(id);
        }
        [HttpGet("GetAll")]
        [Authorize(Roles = "Admin, Rol Read")]
        public async Task<List<Lens>> GetAllLenses()
        {
            return await _lensService.GetLensAsync();
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("Create")]
        public async Task Create(LensDto lens)
        {
            await _lensService.AddLensAsync(lens);
        }

        [HttpPut("Edit/{id}")]
        [Authorize(Roles = "Admin")]
        public async Task EditLens(int id, [FromBody] LensDto value)
        {
            await _lensService.EditLensAsync(value, id);
        }
        

        [HttpDelete("Delete/{id}")]
        [Authorize(Roles = "Admin")]
        public async Task DeleteLens(int id)
        {
            await _lensService.DeleteLensAsync(id);
        }

        

    }
}
