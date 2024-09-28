# Mi Aplicación Node.js con MySQL 🎵🚀

¡Bienvenid@ a mi proyecto! Este es un CRUD básico de gestión de bandas musicales, construido con JS, Node.js, Express y MySQL. Esta aplicación permite realizar operaciones como crear, leer, actualizar y eliminar (CRUD) bandas musicales desde una base de datos MySQL.

## 📋 ¿Qué hace esta aplicación?
Esta aplicación gestiona información sobre bandas musicales. Con ella puedes:

Crear nuevas bandas musicales, incluyendo detalles como nombre, ciudad, género, número de álbumes y estado de actividad.
Leer la lista de todas las bandas almacenadas en la base de datos.
Relacionar datos de las bandas procedentes de las fiferentes tablas contenedoras de información.
Actualizar información existente sobre una banda.
Eliminar bandas de la base de datos cuando ya no sean relevantes.

## 🔧 Tecnologías usadas

Esta aplicación está construida usando las siguientes tecnologías:

Node.js: Como entorno de ejecución para JavaScript del lado del servidor.
Express: Framework de Node.js que permite crear aplicaciones web y APIs de manera sencilla y rápida.
MySQL2: Librería de Node.js que permite la conexión y ejecución de consultas SQL.
javaScript: JavaScript como  lenguaje principal de programación de Express.
Postman: Herramienta usada para probar las rutas del API y validar las operaciones CRUD.

## 🚀 Cómo usar esta aplicación

Configurar la base de datos: Asegúrate de tener MySQL instalado y crea una base de datos. Tienes un ejemplo en el archivo del repositorio SQL_export. Puedes ajustar la configuración de la base de datos en un archivo .env para que coincida con tu entorno.

Clona el repositorio.

Instalar dependencias: 

Inicia el servidor con el siguiente comando:

node src/index.js
npm run dev
Asegúrate de enviar las solicitudes a http://localhost:4000.




## 🌱 ¿Qué he aprendido?
Este proyecto me ha permitido aprender y reforzar mis conocimientos en:

Node.js y cómo crear un servidor utilizando Express.
Cómo hacer consultas SQL a una base de datos MySQL desde una aplicación Node.js usando MySQL2.
El manejo de rutas REST para una API.
Gestión de errores en el servidor y buenas prácticas en el manejo de respuestas JSON.
Cómo conectar y desconectar de manera eficiente una base de datos en un entorno asíncrono.
Uso de Postman para probar y validar rutas de API.
