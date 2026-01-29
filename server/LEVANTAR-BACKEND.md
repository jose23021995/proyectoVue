# Cómo levantar el backend (y que funcione con el front)

## Requisitos en tu PC

1. **Node.js** (v18 recomendado). Si usas nvm: `nvm use` dentro de la carpeta `server`.
2. **MySQL** instalado y en ejecución, con una base de datos llamada `emarket`.

## Crear la base de datos (solo la primera vez)

En MySQL (o MySQL Workbench / línea de comandos):

```sql
CREATE DATABASE emarket;
```

Usuario y contraseña por defecto que espera el backend: `root` / `12345678`. Si usas otros, configúralos en `.env`.

## Pasos para levantar el backend

Abre una terminal **en la carpeta del servidor**:

```powershell
cd A:\proyectos\vue\enero\emarket\server
```

### Opción A: Script automático (PowerShell)

```powershell
.\levantar-backend.ps1
```

Ese script hace: instalar dependencias, cargar datos de ejemplo y arrancar el servidor.

### Opción B: Comandos manuales

```powershell
cd A:\proyectos\vue\enero\emarket\server
npm install
npm run seed
npm start
```

- **`npm run seed`**: solo la primera vez (o si vacías la BD). Crea tablas y datos de prueba.
- **`npm start`**: deja el backend corriendo en **http://localhost:8081**.

## Archivo .env

Si no existe `server\.env`, cópialo desde `example.env`:

```powershell
Copy-Item example.env .env
```

Edita `.env` y revisa al menos:

- `DB_USER` y `DB_PASS`: usuario y contraseña de MySQL.
- `DB_NAME=emarket`.

El frontend ya está configurado para usar **http://localhost:8081** como API.

## Levantar también el frontend

En **otra** terminal:

```powershell
cd A:\proyectos\vue\enero\emarket\shop
npm install
npm run serve
```

Luego abre en el navegador: **http://localhost:8080**.

## Si algo falla

- **"npm no se reconoce"**: abre una terminal donde Node esté en el PATH (por ejemplo "Node.js command prompt" o ejecuta `nvm use` antes).
- **"Unable to connect to the database"**: MySQL debe estar en marcha y la base `emarket` creada; revisa usuario/contraseña en `.env`.
- **Puerto 8081 en uso**: cambia `PORT` en `.env` (y luego tendrías que cambiar la URL del API en el front si usas otro puerto).
