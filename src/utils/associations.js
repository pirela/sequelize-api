module.exports = function (models) {
  const pais = models.pais;
  const persona = models.persona;
  const telefono = models.telefono;

  pais.hasOne(persona, {
    foreignKey: "idPais",
  });
  persona.belongsTo(pais, {
    foreignKey: "idPais",
  });

  persona.hasMany(telefono, {
    foreignKey: "idPersona",
  });
  telefono.belongsTo(persona, {
    foreignKey: "idPersona",
  });
};
