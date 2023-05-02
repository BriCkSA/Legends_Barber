#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Legends_Barber_API/Legends_Barber_API.csproj", "Legends_Barber_API/"]
RUN dotnet restore "Legends_Barber_API/Legends_Barber_API.csproj"
COPY . .
WORKDIR "/src/Legends_Barber_API"
RUN dotnet build "Legends_Barber_API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Legends_Barber_API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Legends_Barber_API.dll"]