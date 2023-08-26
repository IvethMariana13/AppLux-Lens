using Microsoft.AspNetCore.Authentication.Certificate;
using Microsoft.OpenApi.Models;
using System.Security.Cryptography.X509Certificates;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Test API DF", Version = "v1" });
});

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

var env = app.Services.GetService<IWebHostEnvironment>();

// Configure the HTTP request pipeline.

if (env.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
    });
    app.UseExceptionHandler("/error-development");
}
else
{
    app.UseExceptionHandler("/error");
}

app.UseHttpsRedirection();



app.UseAuthentication();
app.UseAuthorization();


app.MapControllers();

app.Run();
