using AutoMapper;
using Lux_Lens.AppServices.Shared.Dto;
using Lux_Lens.Core.Entities;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.ApplicationServices
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            CreateMap<LensDto, Core.Entities.Lens>();
            CreateMap<Core.Entities.Lens, LensDto>();

            CreateMap<IdentityUser, UserDto>();
            CreateMap<UserDto, IdentityUser>();

            CreateMap<IdentityUser, NewUserDto>();
            CreateMap<NewUserDto, IdentityUser>();

        }
    }
}
