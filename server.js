const express = require("express");

const app = express();
app.get("/", (_request, response) => response.send("Hello from Node on Caster"));
app.listen(process.env.PORT || 8080, "0.0.0.0");
