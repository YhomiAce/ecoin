'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class CryptBank extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  CryptBank.init({
    id: {
      allowNull: false,
      primaryKey: true,
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV1,
    },
    bank_name: {
      allowNull: true,
      type: DataTypes.STRING,
    },
    acc_name: {
      allowNull: true,
      type: DataTypes.STRING,
      defaultValue: "0",
    },
    acc_number: {
      allowNull: true,
      type: DataTypes.STRING,
      defaultValue: "0",
    },
  }, {
    sequelize,
    modelName: 'CryptBank',
    timestamps: true,
    paranoid: true,
    tableName: 'CryptBanks',
  });
  return CryptBank;
};