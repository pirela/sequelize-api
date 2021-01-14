import express from "express";
import cors from "cors";

import config from "./config";
import { logger } from "./utils";

import apiRoutes from "./api/api";

import publicRoutes from "./api/public";

import bodyParser from "body-parser";

const app = express();

app.use(cors());
app.use(bodyParser.json({ limit: "50mb" }));
app.use(
  bodyParser.urlencoded({
    limit: "50mb",
    extended: true,
    parameterLimit: 50000,
  })
);

app.use("/public", publicRoutes);
app.use("/api/v1", apiRoutes);

app.get("/", (req, res) => {
  res.send("Test express and sequelize");
});

app.listen({ port: config.port }, () => {
  logger.info(`\n\n🚀 Server ready at http://localhost:${config.port}\n\n`);
});

process.on("uncaughtException", (e) => {
  console.log(
    "An error has occured. error is: %s and stack trace is: %s",
    e,
    e.stack
  );
  console.log("Process will restart now.");
  process.exit(1);
});
