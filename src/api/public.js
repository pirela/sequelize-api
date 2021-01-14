import express from "express";

import personaRoutes from "./routes/persona";

const publicRoutes = express.Router();

publicRoutes.use("/persona", personaRoutes);

publicRoutes.get("/", (req, res) => {
  res.send("Test express and sequelize");
});

export default publicRoutes;
