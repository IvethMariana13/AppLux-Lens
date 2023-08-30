using System.Drawing;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Castle.Components.DictionaryAdapter.Xml;
using Lux_Lens.ApplicationServices.Lens;
using Lux_Lens.AppServices.Shared.Dto;
using Lux_Lens.Core.Entities;
using LuxLens.Api.Controllers.LensControllers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Moq;
using NUnit.Framework;

namespace Lux_Lens.UnitTest
{
    [TestFixture]
    public class LensTest
    {
        private Mock<ILensService> _LensServiceMock;
        private LensController _LensController;

        [SetUp]
        public void Setup()
        {
            _LensServiceMock = new Mock<ILensService>();
            _LensController = new LensController(_LensServiceMock.Object);
        }

        [Test]
        public void CreateTest()
        {
            // Arrange
            var lensDto = new LensDto
            {
                Cantidad = 100,
                Precio = 100,
                Marca = "MarcaTest",
                Modelo = "ModeloTest",
                Color = "ColorTest",
                Material = "MaterialTest"
            };

            // Act
            var result =  _LensController.Create(lensDto);

            // Assert
            Assert.IsNotNull(result);
            Assert.IsTrue(result.IsCompletedSuccessfully);

        }

        [Test]
        public void UpdateTest() 
        {
            // Arrange
            var lensDto = new LensDto
            {
                Cantidad = 100,
                Precio = 100,
                Marca = "MarcaTest",
                Modelo = "ModeloTest",
                Color = "ColorTest",
                Material = "MaterialTest"
            };

            //Act
            var result = _LensController.EditLens(1,lensDto);

            // Assert
            Assert.IsNotNull(result);
            Assert.IsTrue(result.IsCompletedSuccessfully);

        }

        [Test]
        public void GetByIdTest()
        {
            // Arrange
            var lensId = 1;

            var lensDto = new Core.Entities.Lens
            {
                Cantidad = 100,
                Precio = 100,
                Marca = "MarcaTest",
                Modelo = "ModeloTest",
                Color = "ColorTest",
                Material = "MaterialTest"
            };

            _LensServiceMock.Setup(service => service.GetLensByIdAsync(lensId))
                        .ReturnsAsync(lensDto);

            // Act
            var result = _LensController.GetById(lensId);

            // Assert
            // Assert
            var lens = result.Result;
            Assert.NotNull(lens);
            Assert.That(lensDto, Is.EqualTo(lens));
        }

        [Test]
        public void GetAllByIdTest()
        {
            // Arrange
            var lens = new List<Core.Entities.Lens>
            {
                new Core.Entities.Lens
                {
                    Cantidad = 100,
                    Precio = 100,
                    Marca = "MarcaTest",
                    Modelo = "ModeloTest",
                    Color = "ColorTest",
                    Material = "MaterialTest"
                },
                new Core.Entities.Lens
                {
                    Cantidad = 200,
                    Precio = 200,
                    Marca = "MarcaTest2",
                    Modelo = "ModeloTest2",
                    Color = "ColorTest2",
                    Material = "MaterialTest2"
                },
            };

            _LensServiceMock.Setup(service => service.GetLensAsync()).ReturnsAsync(lens);

            // Act
            var result = _LensController.GetAllLenses();

            // Assert
            var lenses = result.Result;
            Assert.NotNull(lenses);
            Assert.That(lens, Is.EqualTo(lenses));
        }


    }
}