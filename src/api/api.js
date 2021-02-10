import express from "express";

import { logger, excludeDef } from "../utils";

import db from "../models";

const Sequelize = require("sequelize");
const Op = Sequelize.Op;

/**
 * Declaracion de los modelos a utilizar
 */
const Model = db.persona;
const ModelTelefono = db.telefono;
const ModelPais = db.pais;

/**
 * Declaracion de las rutas
 */

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

/**
 * endpoint para la consulta de todas las personas con sus respectivos telefonos.
 * Consulta para traer todas las personas
 * excluyendo los valores en el parametro exclude,
 * ordenados por createdAt de manera descendete
 * asi como tambien traer el "JOIN" con los telefonos
 * solo nos traemos el atributo telefono del modelo telefono
 */
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
      throw new Error("No se encontraron las personas");
    }
  } catch (e) {
    logger.error(e.message);
    res.status(500).json({ error: e.message });
  }
});

/**
 * endpoint para la consulta de todas las personas con su respectivo pais.
 * Consulta para traer todas las personas
 * excluyendo los valores en el parametro exclude,
 * ordenados por createdAt de manera descendete
 * asi como tambien traer el "JOIN" con el pais
 * solo nos traemos el atributo nombre del modelo pais
 */
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
          attributes: ["nombre"],
        },
      ],
    });
    if (personas) {
      res.status(200).json({ data: personas });
    } else {
      throw new Error("No se encontraron las personas");
    }
  } catch (e) {
    logger.error(e.message);
    res.status(500).json({ error: e.message });
  }
});

/**
 * endpoint para la consulta de todas las personas
 * Consulta para traer todas las personas
 * excluyendo los valores en el parametro exclude,
 * ordenados por createdAt de manera descendete
 * asi como tambien traer el "JOIN" con el pais y sus telefonos
 * no excluimos ningun valor del pais ni de telefono
 */
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

/**
 * endpoint para la consulta de una(s) persona(s) segun parametros
 * Consulta para traer personas segun parametros recibidos
 * excluyendo los valores en el parametro exclude,
 * ordenados por nombre de manera ascendete
 * filtramos la busqueda con likes
 */
apiRoutes.post("/persona-like", async (req, res) => {
  try {
    const data = req.body;
    const where = {};
    if (data.nombre) {
      where.nombre = {
        [Op.like]: `%${data.nombre}%`,
      };
    }
    if (data.apellido) {
      where.apellido = {
        [Op.like]: `%${data.apellido}%`,
      };
    }
    if (data.identificacion) {
      where.identificacion = {
        [Op.like]: `%${data.identificacion}%`,
      };
    }
    if (data.email) {
      where.email = {
        [Op.like]: `%${data.email}%`,
      };
    }
    if (data.genero) {
      where.genero = {
        [Op.like]: `%${data.genero}%`,
      };
    }

    const personas = await Model.findAll({
      attributes: [
        "id",
        "identificacion",
        "nombre",
        "apellido",
        "email",
        "img",
      ],
      order: [["nombre", "ASC"]],
      where,
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

/**
 *En caso de no encontrar la ruta retornamos un 404 diciendo Oooops! 404
 *en caso contrario continuamos con la ejecucion
 */
apiRoutes.use((req, res, next) => {
  if (!req.route) {
    return res.status(404).json({
      error: "Oooops! 404",
    });
  }
  next();
});

export default apiRoutes;
