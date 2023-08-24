using Lux_Lens.ApplicationServices.Lens.Authentication;
using Lux_Lens.AppServices.Shared.Dto;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace LuxLens.Api.Controllers.Authentication
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] NewUserDto value)
        {

            if (ModelState.IsValid)
            {
                IdentityResult result = await _userService.AddUserAsync(value);

                if (result.Succeeded)
                {
                    return Ok(new
                    {
                        hasError = false,
                        message = "User Registered",
                        model = (List<UserDto>)await _userService.GetUsersAsync(),
                        requestId = System.Diagnostics.Activity.Current?.Id
                    });
                }
                else
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(error.Code, error.Description);

                    }
                    return Ok(new
                    {
                        hasError = true,
                        message = "Bad Request",
                        model = result.Errors,
                        requestId = System.Diagnostics.Activity.Current?.Id
                    });
                }
            }
            else
            {
                return BadRequest(new
                {
                    hasError = true,
                    message = "Bad Request",
                    model = new { title = "Bad Request", message = "Your request is incorrect, verify it" },
                    requestId = System.Diagnostics.Activity.Current?.Id
                });
            }
        }
    }
}
