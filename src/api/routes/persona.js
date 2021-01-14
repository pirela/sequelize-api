import express from "express";

import {
  deletePersona,
  getPersonaById,
  getPersonaLimit,
  postPersona,
  putPersona,
} from "./persona/index";

const personaRoutes = express.Router();

personaRoutes.post("/", postPersona());
personaRoutes.get("/all/:cantidad", getPersonaLimit());
personaRoutes.get("/:id", getPersonaById());
personaRoutes.put("/", putPersona());
personaRoutes.delete("/:id", deletePersona());

export default personaRoutes;
