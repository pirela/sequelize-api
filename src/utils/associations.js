//creacion de las relaciones entre los modelos
module.exports = function (models) {
  //asignacion de los modelos
  const pais = models.pais;
  const persona = models.persona;
  const telefono = models.telefono;
  /**
   * implemetacion de las relaciones
   * Persona - Pais
   * Persona - Telefono
   */
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
