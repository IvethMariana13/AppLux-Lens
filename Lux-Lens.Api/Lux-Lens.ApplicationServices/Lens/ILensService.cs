using AutoMapper.Execution;
using Lux_Lens.AppServices.Shared.Dto;

namespace Lux_Lens.ApplicationServices.Lens
{
    public interface ILensService
    {
        Task<List<Core.Entities.Lens>> GetLensAsync();

        Task<int> AddLensAsync(LensDto lens);

        Task DeleteLensAsync(int lensId);

        Task<Core.Entities.Lens> GetLensByIdAsync(int lensId);

        Task EditLensAsync(LensDto lens, int id);
    }
}
