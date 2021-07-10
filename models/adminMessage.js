'use strict';
const {
  Model
} = require('sequelize');
const dayjs = require("dayjs");
module.exports = (sequelize, DataTypes) => {
  class AdminMessage extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    
  };
  AdminMessage.init({
    id: {
      primaryKey: true,
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV1,
    },
    title: {
        allowNull: true,
        type: DataTypes.STRING
    },
    message: {
      allowNull: true,
      type: DataTypes.TEXT
    },
    
  }, {
    sequelize,
    modelName: 'AdminMessage',
    timestamps: true,
    paranoid: true,
    tableName: 'adminmessages',
  });
  return AdminMessage;
};