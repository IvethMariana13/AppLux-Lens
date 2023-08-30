using AutoMapper;
using Lux_Lens.ApplicationServices.Lens.Authentication;
using Lux_Lens.AppServices.Shared.Dto;
using Lux_Lens.DataAccess;
using LuxLens.Api.Controllers.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Moq;


namespace Lux_Lens.UnitTest
{
    [TestFixture]
    public class AuthTest
    {

        // Mocks para los servicios y controladores necesarios
        private Mock<IUserService> _userServiceMock;
        private Mock<RoleManager<IdentityRole>> _roleManagerMock;
        private Mock<UserManager<IdentityUser>> _userManagerMock;

        // Controlador UserController a probar
        private UserController _userController;

        [SetUp]
        public void Setup()
        {
            _userServiceMock = new Mock<IUserService>();
            _roleManagerMock = new Mock<RoleManager<IdentityRole>>(
                Mock.Of<IRoleStore<IdentityRole>>(),
                null, null, null, null);

            _userManagerMock = new Mock<UserManager<IdentityUser>>(
                Mock.Of<IUserStore<IdentityUser>>(),
                null, null, null, null, null, null, null, null);

            _userController = new UserController(
                _userServiceMock.Object,
                _roleManagerMock.Object,
                _userManagerMock.Object);
        }

        [Test]
        public async Task Post_ValidUser()
        {
            // Arrange
            // Preparación de datos y configuración de comportamientos simulados
            var newUserDto = new NewUserDto
            {
                Email = "test@example.com",
                Password = "P@ssw0rd",
                PhoneNumber = "1234567890",
            };

            // Configuración del comportamiento simulado para el método AddUserAsync
            _userServiceMock.Setup(x => x.AddUserAsync(newUserDto))
                            .ReturnsAsync(IdentityResult.Success);

            // Configuración del comportamiento simulado para el método GetUsersAsync
            _userServiceMock.Setup(x => x.GetUsersAsync())
                            .ReturnsAsync(new List<UserDto>());

            // Act
            // Acción: Llamada al método a probar
            var result = await _userController.Post(newUserDto);

            // Assert
            // Verificación de resultados esperados
            Assert.IsInstanceOf<OkObjectResult>(result);
            var okResult = result as OkObjectResult;
            Assert.AreEqual(200, okResult.StatusCode);
        }

        [Test]
        public async Task CreateRole()
        {
            // Arrange
            var roleName = "TestRole";

            // Configurar el mock para que devuelva "false" cuando se verifique si el rol existe
            _roleManagerMock.Setup(x => x.RoleExistsAsync(roleName))
                            .ReturnsAsync(false);

            // Configurar el mock para que devuelva un resultado exitoso cuando se cree el rol
            _roleManagerMock.Setup(x => x.CreateAsync(It.IsAny<IdentityRole>()))
                            .ReturnsAsync(IdentityResult.Success);

            // Act
            // Llamar al método CreateRole del controlador UserController
            var result = await _userController.CreateRole(roleName);

            // Assert
            // Verificar que el resultado sea un OkObjectResult (código de respuesta HTTP 200 OK)
            Assert.IsInstanceOf<OkObjectResult>(result);
            var okResult = result as OkObjectResult;
            Assert.AreEqual(200, okResult.StatusCode);
        }


        [Test]
        public async Task AssignRoleToUser()
        {
            // Arrange
            var userId = "1";
            var roleName = "TestRole";
            var user = new IdentityUser { Id = userId, UserName = "testuser" };

            // Configurar el mock para que devuelva el usuario cuando se busque por ID
            _userManagerMock.Setup(x => x.FindByIdAsync(userId))
                            .ReturnsAsync(user);

            // Configurar el mock para que devuelva "true" cuando se verifique si el rol existe
            _roleManagerMock.Setup(x => x.RoleExistsAsync(roleName))
                            .ReturnsAsync(true);

            // Configurar el mock para que devuelva "false" cuando se verifique si el usuario tiene el rol
            _userManagerMock.Setup(x => x.IsInRoleAsync(user, roleName))
                            .ReturnsAsync(false);

            // Configurar el mock para que devuelva un resultado exitoso al agregar el usuario al rol
            _userManagerMock.Setup(x => x.AddToRoleAsync(user, roleName))
                            .ReturnsAsync(IdentityResult.Success);

            // Act
            // Llamar al método AssignRoleToUser del controlador UserController
            var result = await _userController.AssignRoleToUser(userId, roleName);

            // Assert
            // Verificar que el resultado sea un OkObjectResult (código de respuesta HTTP 200 OK)
            Assert.IsInstanceOf<OkObjectResult>(result);
            var okResult = result as OkObjectResult;
            Assert.AreEqual(200, okResult.StatusCode);
        }


    }
}
