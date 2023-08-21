using AutoMapper;
using AutoMapper.Execution;
using Lux_Lens.AppServices.Shared.Dto;
using Lux_Lens.DataAccess.Repositories;
using Microsoft.EntityFrameworkCore;


namespace Lux_Lens.ApplicationServices.Lens
{
    public class LensService : ILensService
    {
        private readonly IRepository<int, Core.Entities.Lens> _repository;
        private readonly IMapper _mapper; 

        public LensService(IRepository<int, Core.Entities.Lens> repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }


        public async Task<int> AddLensAsync(LensDto lens)
        {
            var m = _mapper.Map<Core.Entities.Lens>(lens);
            await _repository.AddAsync(m);
            return 1;
        }
       

        public async Task DeleteLensAsync(int lensId)
        {
            await _repository.DeleteAsync(lensId);
        }

        public async Task EditLensAsync(LensDto lens, int id)
        {
            Core.Entities.Lens len = new Core.Entities.Lens
            {
                Id = id,
                Modelo = lens.Modelo,
                Marca = lens.Marca,
                Cantidad = lens.Cantidad,
                Color = lens.Color,
                Material = lens.Material,
                Precio = lens.Precio,
            };
            await _repository.UpdateAsync(len);
        }

        public async Task<List<Core.Entities.Lens>> GetLensAsync()
        {
            var m = await _repository.GetAll().ToListAsync();
            List<Core.Entities.Lens> lens = _mapper.Map<List<Core.Entities.Lens>>(m);
            return lens;
        }

        public async Task<Core.Entities.Lens> GetLensByIdAsync(int lensId)
        {
            var m = await _repository.GetAsync(lensId);
            Core.Entities.Lens lens = _mapper.Map<Core.Entities.Lens>(m);
            return lens;
        }
    }
}
