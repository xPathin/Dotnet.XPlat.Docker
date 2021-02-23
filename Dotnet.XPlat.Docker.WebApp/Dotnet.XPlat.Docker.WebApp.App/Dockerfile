FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Dotnet.XPlat.Docker.WebApp.App/Dotnet.XPlat.Docker.WebApp.App.csproj", "Dotnet.XPlat.Docker.WebApp.App/"]
RUN dotnet restore "Dotnet.XPlat.Docker.WebApp.App/Dotnet.XPlat.Docker.WebApp.App.csproj"
COPY . .
WORKDIR "/src/Dotnet.XPlat.Docker.WebApp.App"
RUN dotnet build "Dotnet.XPlat.Docker.WebApp.App.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Dotnet.XPlat.Docker.WebApp.App.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Dotnet.XPlat.Docker.WebApp.App.dll"]
