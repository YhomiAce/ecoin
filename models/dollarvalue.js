'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class DollarValue extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  DollarValue.init({
    id: {
      allowNull: false,
      primaryKey: true,
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV1,
    },
    name: {
      allowNull: true,
      type: DataTypes.STRING,
      defaultValue: "dollar",
    },
    amount: {
      allowNull: true,
      type: DataTypes.DECIMAL(65, 0),
      defaultValue: 0,
    },
  }, {
    sequelize,
    modelName: 'DollarValue',
    timestamps: true,
    paranoid: true,
    tableName: 'DollarValues',
  });
  return DollarValue;
};