FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Dotnet.XPlat.Docker.WebApi.App/Dotnet.XPlat.Docker.WebApi.App.csproj", "Dotnet.XPlat.Docker.WebApi.App/"]
RUN dotnet restore "Dotnet.XPlat.Docker.WebApi.App/Dotnet.XPlat.Docker.WebApi.App.csproj"
COPY . .
WORKDIR "/src/Dotnet.XPlat.Docker.WebApi.App"
RUN dotnet build "Dotnet.XPlat.Docker.WebApi.App.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Dotnet.XPlat.Docker.WebApi.App.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Dotnet.XPlat.Docker.WebApi.App.dll"]
