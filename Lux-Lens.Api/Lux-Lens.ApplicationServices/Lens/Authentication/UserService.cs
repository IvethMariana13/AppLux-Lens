using AutoMapper;
using Lux_Lens.AppServices.Shared.Dto;
using Lux_Lens.DataAccess;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.ApplicationServices.Lens.Authentication
{
    public class UserService :IUserService
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly LensDbContext _context;
        private readonly IMapper _mapper;
        public UserService(UserManager<IdentityUser> userManager, LensDbContext context, IMapper mapper)
        {
            _userManager = userManager;
            _context = context;
            _mapper = mapper;
        }
        public async Task<IdentityResult> AddUserAsync(NewUserDto userDto)
        {
            var result = await _userManager.CreateAsync(new IdentityUser
            {
                Email = userDto.Email,
                EmailConfirmed = true,
                UserName = userDto.Email,
                PhoneNumber = userDto.PhoneNumber
            }, userDto.Password);

            return result;

        }
        public async Task<IEnumerable<UserDto>> GetUsersAsync()
        {
            List<IdentityUser> users = await _userManager.Users.ToListAsync();

            List<UserDto> usersDto = new List<UserDto>();

            foreach (var user in users)
            {
                usersDto.Add(_mapper.Map<UserDto>(user));
            }

            return usersDto;
        }
    }
}
