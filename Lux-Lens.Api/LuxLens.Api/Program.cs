using Lux_Lens.ApplicationServices.Lens;
using Lux_Lens.ApplicationServices.Lens.Authentication;
using Lux_Lens.Core.Entities;
using Lux_Lens.DataAccess;
using Lux_Lens.DataAccess.Repositories;
using Microsoft.AspNetCore.Authentication.Certificate;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.AspNetCore.Server.Kestrel.Https;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<ILensService, LensService>();
builder.Services.AddTransient<IUserService, UserService>();
builder.Services.AddTransient<IRepository<int, Lens>, Repository<int, Lens>>();

builder.Services.AddAutoMapper(typeof(Lux_Lens.ApplicationServices.MapperProfile));
//Conexion de Bd

string connectionString = builder.Configuration.GetConnectionString("Default");
builder.Services.AddDbContext<LensDbContext>(options =>
                options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));




builder.Services.AddIdentity<IdentityUser, IdentityRole>(options => options.SignIn.RequireConfirmedAccount = true)
                .AddEntityFrameworkStores<LensDbContext>();

builder.Services.AddSwaggerGen(option =>
{
    option.AddSecurityDefinition(JwtBearerDefaults.AuthenticationScheme, new OpenApiSecurityScheme
    {
        Description = "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter your token in the text input below.\r\n",
        In = ParameterLocation.Header,
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        BearerFormat = "JWT",
        Scheme = JwtBearerDefaults.AuthenticationScheme
    });

    option.AddSecurityRequirement(new OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type=ReferenceType.SecurityScheme,
                    Id=JwtBearerDefaults.AuthenticationScheme
                }
            },
            new string[]{}
        }
    });
});

//Kestrel
builder.Services.Configure<KestrelServerOptions>(options =>
{
    options.ConfigureHttpsDefaults(options => {
        // Utilizamos el certificado del servicio 1
        options.ServerCertificate = X509Certificate2.CreateFromPemFile("certificate/server.crt", "certificate/server.key");
        // Configuramos el protocolo mTLS
        options.ClientCertificateMode = ClientCertificateMode.RequireCertificate;
        // Aceptamos cualquier certificado de cliente porque relaizaremos la autenticación en el middleware de autenticación
        options.AllowAnyClientCertificate();
    });

});

builder.Services
    .AddHttpContextAccessor()
    .AddAuthentication(options =>
    {
        options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
    })
    .AddJwtBearer(options =>
    {
        options.RequireHttpsMetadata = false;
        options.SaveToken = true;
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = builder.Configuration["Jwt:Issuer"],
            ValidAudience = builder.Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
        };
    });

builder
    .Services
    .AddAuthorization(options =>
    {
        // requiere autenticación para acceder a cualquier endpoint
        options.DefaultPolicy = new AuthorizationPolicyBuilder()
            .RequireAuthenticatedUser()
            .Build();
    })
    .AddAuthentication(CertificateAuthenticationDefaults.AuthenticationScheme)
    .AddCertificate(options =>
    {
        // ignoramos la revocación de los certificados
        options.RevocationMode = X509RevocationMode.NoCheck;
        // validamos la fecha de caducidad
        options.ValidateValidityPeriod = true;
        // validamos que el certificado sea de tipo chained
        options.AllowedCertificateTypes = CertificateTypes.Chained;
        // le indicamos que la cadena de confianza la vamos a especificar nosotros
        options.ChainTrustValidationMode = X509ChainTrustMode.CustomRootTrust;
        // añadimos la CA como raíz de confianza
        var rootcert = new X509Certificate2("certificate/server.crt");
        options.CustomTrustStore.Clear();
        options.CustomTrustStore.Add(rootcert);
    });

//CORS
builder.Services.AddCors(options =>
    {
        options.AddPolicy("AllowWebApp", builder =>
       {
            builder.AllowAnyOrigin()
            .AllowAnyHeader()
            .AllowAnyMethod();
        });
    });


var app = builder.Build();


using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    var context = services.GetRequiredService<LensDbContext>();
    context.Database.Migrate();
}


app.UseCors("AllowWebApp");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();


app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
