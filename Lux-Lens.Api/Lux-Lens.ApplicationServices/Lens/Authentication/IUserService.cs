using Lux_Lens.AppServices.Shared.Dto;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.ApplicationServices.Lens.Authentication
{
    public interface IUserService
    {
        Task<IdentityResult> AddUserAsync(NewUserDto userDto);
        Task<IEnumerable<UserDto>> GetUsersAsync();
    }
}
