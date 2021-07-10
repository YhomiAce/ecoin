'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ResetPassword extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  ResetPassword.init({
    id: {
      allowNull: false,
      primaryKey: true,
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV1,
    },
    user_email: {
      allowNull: true,
      type: DataTypes.STRING,
    },
    token: {
      allowNull: true,
      type: DataTypes.STRING,
      defaultValue: 0,
    },
    status: {
      allowNull: true,
      type: DataTypes.INTEGER,
      defaultValue: 0,
    },
  }, {
    sequelize,
    modelName: 'ResetPassword',
    timestamps: true,
    paranoid: true,
    tableName: 'ResetPasswords',
  });
  return ResetPassword;
};