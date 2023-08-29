using Lux_Lens.ApplicationServices.Lens.Authentication;
using Lux_Lens.AppServices.Shared.Dto;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace LuxLens.Api.Controllers.Authentication
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserController : ControllerBase
    {
        
        private readonly IUserService _userService;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<IdentityUser> _userManager;

        public UserController(IUserService userService, RoleManager<IdentityRole> roleManager, UserManager<IdentityUser> userManager)
        {
            _userService = userService;
            _roleManager = roleManager;
            _userManager = userManager;
        }


        [HttpPost]
        [Authorize(Roles = "Admin")]
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

        [HttpPost("create-role")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CreateRole([FromBody] string roleName)
        {
            if (!await _roleManager.RoleExistsAsync(roleName))
            {
                var result = await _roleManager.CreateAsync(new IdentityRole(roleName));
                if (result.Succeeded)
                {
                    return Ok($"Role '{roleName}' created successfully");
                }
                else
                {
                    return BadRequest(result.Errors);
                }
            }
            else
            {
                return BadRequest($"Role '{roleName}' already exists");
            }
        }

        [HttpPost("assign-role")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> AssignRoleToUser(string userId, string roleName)
        {
            var user = await _userManager.FindByIdAsync(userId); // Encuentra al usuario por su Id

            if (user != null)
            {
                if (await _roleManager.RoleExistsAsync(roleName))
                {
                    if (!await _userManager.IsInRoleAsync(user, roleName))
                    {
                        var addToRoleResult = await _userManager.AddToRoleAsync(user, roleName);

                        if (addToRoleResult.Succeeded)
                        {
                            return Ok($"Role '{roleName}' assigned to user '{user.UserName}' successfully");
                        }
                        else
                        {
                            return BadRequest(addToRoleResult.Errors);
                        }
                    }
                    else
                    {
                        return BadRequest($"User '{user.UserName}' already has the role '{roleName}'");
                    }
                }
                else
                {
                    return BadRequest($"Role '{roleName}' does not exist");
                }
            }
            else
            {
                return BadRequest("User not found");
            }
        }

    }
}
