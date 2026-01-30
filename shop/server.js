const express = require("express");
const serveStatic = require("serve-static");
const history = require("connect-history-api-fallback");
const enforce = require("express-sslify");

const app = express();

const PORT = process.env.PORT || 5000;

// SOLO forzar HTTPS en producción
if (process.env.NODE_ENV === "production") {
  app.use(enforce.HTTPS({ trustProtoHeader: true }));
}

app.use(history());
app.use(serveStatic(__dirname + "/dist"));

app.listen(PORT, () => {
  console.log(`Servidor corriendo en puerto ${PORT}`);
});
