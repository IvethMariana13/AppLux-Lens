using System.Threading.Tasks;
using Castle.Components.DictionaryAdapter.Xml;
using Lux_Lens.ApplicationServices.Lens;
using Lux_Lens.AppServices.Shared.Dto;
using Lux_Lens.Core.Entities;
using LuxLens.Api.Controllers.LensControllers;
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
           _LensController.Create(lensDto); 
            var result = _LensController.GetById(1);

            // Assert

            var a = result.Result;
            Assert.IsNotNull(a);
            Assert.That(lensDto.Precio, Is.EqualTo(a.Precio));
        }

        [Test]
        public void GetAllByIdTest()
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
            _LensController.Create(lensDto);
            var result = _LensController.GetAllLenses();

            // Assert
            Assert.IsNotNull(result);

            // Ensure the result is of type ActionResult<List<Lens>>
            var resultOk = result.Result;
            Assert.IsNotNull(resultOk[1]);

            // Ensure the value in the result is a list of lenses
            Assert.IsInstanceOf<List<Lens>>(resultOk);
            var obtainedLenses = resultOk ;
            Assert.AreEqual(1, obtainedLenses.Count); // There should be one item in the list

            // Compare the properties of the obtained lens with the expected lensDto
            var obtainedLens = obtainedLenses[0];
            Assert.AreEqual(lensDto.Cantidad, obtainedLens.Cantidad);
            Assert.AreEqual(lensDto.Precio, obtainedLens.Precio);
            Assert.AreEqual(lensDto.Marca, obtainedLens.Marca);
            Assert.AreEqual(lensDto.Modelo, obtainedLens.Modelo);
            Assert.AreEqual(lensDto.Color, obtainedLens.Color);
            Assert.AreEqual(lensDto.Material, obtainedLens.Material);
        }


    }
}