using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography.X509Certificates;

namespace LuxLens.Api.Controllers.Authentication
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CertController : ControllerBase
    {
        [HttpGet("Test")]
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
    }
}
