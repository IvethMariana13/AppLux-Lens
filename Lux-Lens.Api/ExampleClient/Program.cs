using ExampleClient;
using Microsoft.AspNetCore.Authentication.Certificate;
using Microsoft.OpenApi.Models;
using System.Net.Http.Headers;
using System.Security.Cryptography.X509Certificates;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Test API DF", Version = "v1" });
});


var handler = new HttpClientHandler();
handler.ClientCertificates.Add(X509Certificate2.CreateFromPemFile("../LuxLens.Api/certificate/client.crt", "../LuxLens.Api/certificate/client.key"));

handler.ServerCertificateCustomValidationCallback = (message, cert, chain, errors) =>
{
    // creamos una política de validación de certificados
    var chainPolicy = new X509ChainPolicy
    {
        // ignoramos la revocación de los certificados
        RevocationMode = X509RevocationMode.NoCheck,
        // validamos la cadena de certificados
        VerificationFlags = X509VerificationFlags.AllowUnknownCertificateAuthority,
        // le indicamos que la cadena de confianza la vamos a especificar nosotros
        TrustMode = X509ChainTrustMode.CustomRootTrust,
        // validamos la fecha de caducidad
        VerificationTime = DateTime.Now,
    };

    // añadimos la CA como raíz de confianza
    var rootcert = new X509Certificate2("../LuxLens.Api/certificate/ca.crt");
    chainPolicy.CustomTrustStore.Clear();
    chainPolicy.CustomTrustStore.Add(rootcert);

    // asignamos la política de validación a la cadena de certificados
    chain ??= new X509Chain();
    chain.ChainPolicy = chainPolicy;

    // validamos el certificado que nos viene del servidor
    var certificateIsValid = chain.Build(cert);
    return certificateIsValid;
};

//var client = new HttpClient(handler);

//string jwtToken = "";
//var model = new LoginViewModel
//{
//    UserName = "",
//    Password = ""
//};

//client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", jwtToken);
//var response = await client.PostAsJsonAsync("https://localhost:44326/api/Login/", model);
//var content = await response.Content.ReadAsStringAsync();
//Console.WriteLine(response.StatusCode);
//Console.WriteLine(await response.Content.ReadAsStringAsync());

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
