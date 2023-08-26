﻿using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography.X509Certificates;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LuxLens.Api.Controllers.LensControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        // GET: api/<TestController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet("Cert")]
        public IActionResult CheckClientCertificate()
        {
            // Accede a la colección de certificados del cliente
            var clientCert = HttpContext.Connection.ClientCertificate;

            // Verifica si se proporcionó un certificado del cliente
            if (clientCert == null)
            {
                // El cliente no presentó un certificado válido
                return BadRequest("Client certificate not provided.");
            }

            // Realiza comprobaciones adicionales sobre el certificado si es necesario
            // Por ejemplo, puedes verificar la autoridad de certificación emisora, el nombre del cliente, etc.
            // Aquí un ejemplo básico de verificación de la cadena de confianza del certificado:

            var certificateChain = new X509Chain();
            certificateChain.ChainPolicy.RevocationMode = X509RevocationMode.NoCheck; // O ajusta según tus necesidades

            if (certificateChain.Build(clientCert))
            {
                // El certificado del cliente es válido y pasó las verificaciones
                return Ok("Client certificate is valid.");
            }
            else
            {
                // El certificado del cliente no pasó las verificaciones
                return BadRequest("Client certificate is invalid.");
            }
        }

        // GET api/<TestController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<TestController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<TestController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<TestController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
