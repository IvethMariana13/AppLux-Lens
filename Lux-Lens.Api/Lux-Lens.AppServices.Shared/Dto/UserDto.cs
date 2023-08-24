using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.AppServices.Shared.Dto
{
    public class UserDto
    {
        public string Id { get; set; }

        [EmailAddress]
        [Required]
        [StringLength(256)]
        public string UserName { get; set; }

        [Required]
        [StringLength(32)]
        public string PhoneNumber { get; set; }

        [EmailAddress]
        [Required]
        [StringLength(256)]
        public string Email { get; set; }

    }
}
