// IMPORTAR BIBLIOTECAS

const express = require("express");
const cors = require("cors");

const mysql = require("mysql2/promise");

// CONEXIÓN A MYSQL
const getConnection = require("./db/db");

// CREAR VARIABLES
const app = express(); // server
const port = 4000;

// CONFIGURACIÓN DE EXPRESS
app.use(cors());
app.use(express.json({ limit: "25mb" }));

// prueba getConnection

// ARRANCAR EL SERVIDOR

app.listen(port, () => {
  console.log(`Servidor iniciado escuchando en http://localhost:${port}`);
});

// ENDPOINTS API

// maga = {id:1, nombre:"", expecialidad:"", lealtad:"", maestria:"", escuela_de_magia:""}
// GET    /api/magas                 --> [{}, {}]
// GET    /api/magas?search=Nombre       --> [{},{}]
// GET    /api/magas?order=nombre        --> [{},{}]
// GET    /api/magas?incluir_varita=true --> [{},{}]

app.get("/api/bands", async (req, res) => {
  // Obtener conn con MySQL
  const conn = await getConnection();

  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });

    return;
  }

  // Lanzar una query

  const [results] = await conn.query("SELECT * FROM bands;");

  // Devolvemos los resultados como JSON

  res.json(results);

  // Cerrar la conn

  await conn.close();
});

//Post insertar campos

app.post("/api/bands", async (req, res) => {
  console.log(req.body);
  //Obtener la conn
  const conn = await getConnection();

  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });

    return;
  }

  //Insert
  const [results] = await conn.execute(
    `Insert bands(Name,City,Genre,Albums,Active)
 values (?,?,?,?,?);`,
    [
      req.body.Name,
      req.body.City,
      req.body.Genre,
      req.body.Albums,
      req.body.Active,
    ]
  );

  //Respuesta Json

  if (results.affectedRows === 1) {
    res.json({ success: true, id: results.insertId });
  } else {
    res.json({ success: false, error: "No insertado" });
  }

  //Cerrar conexión
  await conn.close();
});

//PUT

app.put("/api/bands/:id", async (req, res) => {
  console.log(req.params, req.body);
  const conn = await getConnection();
  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });
    return;
  }
  const [results] = await conn.execute(
    `
      UPDATE bands
      SET Name=?, City=?, Genre=?, Albums=?, Active=?
      WHERE idBands =?`,
    [
      req.body.Name,
      req.body.City,
      req.body.Genre,
      req.body.Albums,
      req.body.Active,
      req.params.id,
    ]
  );
  console.log(results);
  if (results.changedRows === 0) {
    res.json({ success: false });
  } else {
    res.json({ success: true });
  }
  await conn.close();
});

//DELETE

app.delete("/api/bands/:id", async (req, res) => {
  console.log(req.params, req.body);
  const conn = await getConnection();

  if (!conn) {
    res.status(500).json({ success: false, error: "Error con la conexion." });
    return;
  }

  const [results] = await conn.execute(
    `
      DELETE FROM bands
      WHERE idBands =?`,
    [req.params.id]
  );

  console.log(results);

  if (results.changedRows === 0) {
    res.json({ success: false });
  } else {
    res.json({ success: true });
  }
  await conn.close();
});
