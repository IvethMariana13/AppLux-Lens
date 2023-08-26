using System.Security.Cryptography.X509Certificates;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddHttpClient("MyApiClient", client =>
{
    // Configura la autenticación Mutual TLS
    client.BaseAddress = new Uri("https://localhost:44326");
}).ConfigurePrimaryHttpMessageHandler(() =>
{
    var handler = new HttpClientHandler();

    // Configura el certificado del cliente
    handler.ClientCertificates.Add(new X509Certificate2("certificate/client.pfx", "P@sw0rd1"));

    // Habilita la validación del certificado del servidor (opcional pero recomendado)
    handler.ServerCertificateCustomValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;

    return handler;
});

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
