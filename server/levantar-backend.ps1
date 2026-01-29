# Script para levantar el backend de eMarket
# Ejecutar desde: A:\proyectos\vue\enero\emarket\server
# Requisitos: Node.js instalado, MySQL en marcha con base de datos "emarket"

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

# 1. Crear .env si no existe
if (-not (Test-Path ".env")) {
    Write-Host "Creando .env desde example.env..." -ForegroundColor Yellow
    Copy-Item "example.env" ".env"
    Write-Host "Edita server\.env con tu usuario y contraseña de MySQL (DB_USER, DB_PASS)." -ForegroundColor Yellow
}

# 2. Instalar dependencias
Write-Host "Instalando dependencias..." -ForegroundColor Cyan
npm install
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# 3. Cargar datos de ejemplo (primera vez o tras borrar BD)
Write-Host "Cargando datos de ejemplo en la base de datos..." -ForegroundColor Cyan
npm run seed
if ($LASTEXITCODE -ne 0) {
    Write-Host "Si falla: asegurate de que MySQL este corriendo y que exista la base de datos 'emarket'." -ForegroundColor Red
    exit $LASTEXITCODE
}

# 4. Iniciar servidor
Write-Host "Iniciando backend en http://localhost:8081" -ForegroundColor Green
npm start
