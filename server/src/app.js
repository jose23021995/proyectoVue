console.log("Servidor iniciado...");

const path = require('path');
if (process.env.NODE_ENV !== 'production') {
  require('dotenv').config({ path: path.join(__dirname, '..', '.env') });
}

const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const helmet = require('helmet');
const { sequelize } = require('./models');
const config = require('./config/config');
const app = express();

// Middlewares globales
app.use(helmet()); // Headers de seguridad
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors()); // En producción podrías restringir: cors({ origin: 'https://midominio.com' })

// Logs
if (process.env.NODE_ENV === 'production') {
  app.use(morgan('combined'));
} else {
  app.use(morgan('dev'));
}

// Archivos estáticos
app.use('/public', express.static('public'));

// Configuración Passport
require('./passport');

// Rutas
require('./routes')(app);

// Ruta de prueba
app.get('/', (req, res) => {
  res.send({ message: '¡Servidor funcionando correctamente!' });
});

// Catch-all 404
app.use((req, res) => {
  res.status(404).json({ error: 'Not found' });
});

// Manejo de errores global
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Internal Server Error' });
});

// Conexión a la base de datos y arranque del servidor
const startServer = async () => {
  try {
    await sequelize.authenticate();
    console.log('Conectado a MySQL.');

    await sequelize.sync({ alter: true });
    console.log('Tablas creadas / actualizadas.');

    if (process.env.NODE_ENV !== 'test') {
      app.listen(config.port, () => {
        console.log(`Servidor Express corriendo en el puerto ${config.port}`);
      });
    }
  } catch (err) {
    console.error('No se pudo conectar a la base de datos:', err);
    process.exit(1); // Termina el proceso si falla la DB
  }
};

startServer();

module.exports = app; // Para testing con Jest/Supertest
