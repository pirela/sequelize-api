import express from "express";

import { logger, excludeDef } from "../utils";

import db from "../models";

const Sequelize = require("sequelize");
const Op = Sequelize.Op;

const Model = db.persona;
const ModelTelefono = db.telefono;
const ModelPais = db.pais;

const apiRoutes = express.Router();

apiRoutes.get("/", (req, res) => {
  res.status(200).json({
    data: {
      title: "API ROOT",
      message:
        "this is the root of the API you need to login to access the API!",
    },
  });
});

apiRoutes.get("/persona-telefono", async (req, res) => {
  try {
    const personas = await Model.findAll({
      order: [["createdAt", "DESC"]],
      attributes: {
        exclude: ["createdAt", "updatedAt", "createdUsu", "updatedUsu"],
      },
      include: [
        {
          model: ModelTelefono,
          attributes: ["telefono"],
        },
      ],
    });
    if (personas) {
      res.status(200).json({ data: personas });
    } else {
      throw new Error("No se encontraron los usuario");
    }
  } catch (e) {
    logger.error(e.message);
    res.status(500).json({ error: e.message });
  }
});

apiRoutes.get("/persona-pais", async (req, res) => {
  try {
    const personas = await Model.findAll({
      order: [["createdAt", "DESC"]],
      attributes: {
        exclude: ["createdAt", "updatedAt", "createdUsu", "updatedUsu"],
      },
      order: [["nombre", "DESC"]],
      include: [
        {
          model: ModelPais,
        },
      ],
    });
    if (personas) {
      res.status(200).json({ data: personas });
    } else {
      throw new Error("No se encontraron los usuario");
    }
  } catch (e) {
    logger.error(e.message);
    res.status(500).json({ error: e.message });
  }
});

apiRoutes.get("/persona-completa", async (req, res) => {
  try {
    const personas = await Model.findAll({
      order: [["createdAt", "DESC"]],
      attributes: {
        exclude: ["createdAt", "updatedAt", "createdUsu", "updatedUsu"],
      },
      include: [
        {
          model: ModelPais,
        },
        {
          model: ModelTelefono,
        },
      ],
    });
    if (personas) {
      res.status(200).json({ data: personas });
    } else {
      throw new Error("No se encontraron los usuario");
    }
  } catch (e) {
    logger.error(e.message);
    res.status(500).json({ error: e.message });
  }
});

apiRoutes.get("/persona-like", async (req, res) => {
  try {
    const valueLike = "jose";
    const personas = await Model.findAll({
      attributes: {
        exclude: excludeDef(),
      },
      order: [["nombre", "ASC"]],
      where: {
        nombre: {
          [Op.like]: `%${valueLike}%`,
        },
      },
    });
    if (personas) {
      res.status(200).json({ data: personas });
    } else {
      throw new Error("No se encontraron los usuario");
    }
  } catch (e) {
    logger.error(e.message);
    res.status(500).json({ error: e.message });
  }
});

apiRoutes.use((req, res, next) => {
  if (!req.route) {
    return res.status(404).json({
      error: "Oooops! 404",
    });
  }

  next();
});

export default apiRoutes;
