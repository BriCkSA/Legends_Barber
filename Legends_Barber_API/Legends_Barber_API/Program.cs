var builder = WebApplication.CreateBuilder(args);

// Disable certificate validation
System.Net.ServicePointManager.ServerCertificateValidationCallback +=
    (sender, cert, chain, sslPolicyErrors) => true;

// Add services to the container
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Add default user agent header to IHttpClientFactory for scaffolding


app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();
