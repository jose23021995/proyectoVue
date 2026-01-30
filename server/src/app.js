console.log("Servidor iniciado...");

const path = require('path');

if (process.env.NODE_ENV !== 'production') {
  require('dotenv').config({ path: path.join(__dirname, '..', '.env') });
}

const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const { sequelize } = require('./models');
const config = require('./config/config');

const app = express();

/* ================= MIDDLEWARES ================= */

app.use(cors({
  origin: '*'
}));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

if (process.env.NODE_ENV === 'production') {
  app.use(morgan('combined'));
} else {
  app.use(morgan('dev'));
}

/* =============== STATIC FILES ================== */

app.use('/public', express.static(path.join(__dirname, '../public')));

console.log('Static folder:', path.join(__dirname, '../public'));

/* ================= ROUTES ====================== */

require('./passport');
require('./routes')(app);

app.get('/', (req, res) => {
  res.send({ message: 'Servidor funcionando correctamente' });
});

/* ================= ERRORS ====================== */

app.use((req, res) => {
  res.status(404).json({ error: 'Not found' });
});

/* ================= START ======================= */

const startServer = async () => {
  try {
    await sequelize.authenticate();
    console.log('Conectado a MySQL');

    await sequelize.sync();

    app.listen(config.port, () => {
      console.log(`Servidor corriendo en ${config.port}`);
    });
  } catch (err) {
    console.error(err);
  }
};

startServer();

module.exports = app;
