/**
 *
 * @param {*} sequelize
 * @param {*} DataTypes
 * Se define el modelo pais con la estructura que posee en la  base de datos
 */
module.exports = function (sequelize, DataTypes) {
  return sequelize.define(
    "persona",
    {
      id: {
        type: DataTypes.STRING(255),
        allowNull: false,
        primaryKey: true,
      },
      identificacion: {
        type: DataTypes.STRING(255),
        allowNull: false,
      },
      email: {
        type: DataTypes.STRING(255),
        allowNull: false,
      },
      nombre: {
        type: DataTypes.STRING(255),
      },
      apellido: {
        type: DataTypes.STRING(255),
      },
      clave: {
        type: DataTypes.STRING(255),
      },
      genero: {
        type: DataTypes.STRING(255),
      },
      idPais: {
        type: DataTypes.STRING(255),
      },
      createdUsu: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      updatedUsu: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      createdAt: {
        type: DataTypes.TIME,
        allowNull: false,
      },
      updatedAt: {
        type: DataTypes.TIME,
        allowNull: false,
      },
    },
    {
      tableName: "persona",
    }
  );
};
