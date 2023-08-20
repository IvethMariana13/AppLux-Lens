using AutoMapper.Execution;

namespace Lux_Lens.ApplicationServices.Lens
{
    public interface ILensService
    {
        Task<List<Core.Entities.Lens>> GetLensAsync();

        Task<int> AddLensAsync(Core.Entities.Lens lens);

        Task DeleteLensAsync(int lensId);

        Task<Core.Entities.Lens> GetLensByIdAsync(int lensId);

        Task EditLensAsync(Core.Entities.Lens lens);
    }
}
