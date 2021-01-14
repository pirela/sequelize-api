import bunyan from "bunyan";
import uuid from "uuid/v4";

export const defValues = (isUpdate) => {
  const date = new Date();
  return !isUpdate
    ? {
        id: uuid(),
        createdAt: date,
        updatedAt: date,
        createdUsu: "",
        updatedUsu: "",
      }
    : {
        updatedAt: date,
      };
};

export const excludeDef = () => {
  return ["createdAt", "updatedAt", "createdUsu", "updatedUsu"];
};

export const logger = bunyan.createLogger({
  name: "logger",
  src: true,
  serializers: {
    err: bunyan.stdSerializers.err,
  },
});
