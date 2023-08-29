using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lux_Lens.AppServices.Shared.Dto
{
    public class NewUserDto
    {
        [Required]
        [StringLength(32)]
        public string PhoneNumber { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 5)]
        public string Password { get; set; }

        [EmailAddress]
        [Required]
        [StringLength(256)]
        public string Email { get; set; }
    }
}
