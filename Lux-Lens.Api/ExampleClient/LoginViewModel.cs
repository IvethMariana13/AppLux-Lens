using System.ComponentModel.DataAnnotations;

namespace ExampleClient
{
    public class LoginViewModel
    {
        [Required]
        [EmailAddress]
        public string UserName { get; set;}

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set;}
    }
}
