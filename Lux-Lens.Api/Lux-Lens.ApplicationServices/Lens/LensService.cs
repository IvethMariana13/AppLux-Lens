using AutoMapper.Execution;
using Lux_Lens.DataAccess.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.ApplicationServices.Lens
{
    public class LensService : ILensService
    {
        private readonly IRepository<int, Core.Entities.Lens> _repository;

        public LensService(IRepository<int, Core.Entities.Lens> repository)
        {
            _repository = repository;
        }


        public async Task<int> AddLensAsync(Core.Entities.Lens lens)
        {
            await _repository.AddAsync(lens);
            return lens.Id;
        }

        public async Task DeleteLensAsync(int lensId)
        {
            await _repository.DeleteAsync(lensId);
        }

        public async Task EditLensAsync(Core.Entities.Lens lens)
        {
            await _repository.UpdateAsync(lens);
        }

        public async Task<List<Core.Entities.Lens>> GetLensAsync()
        {
            return await _repository.GetAll().ToListAsync();
        }

        public async Task<Core.Entities.Lens> GetLensByIdAsync(int lensId)
        {
            return await _repository.GetAsync(lensId);
        }
    }
}
