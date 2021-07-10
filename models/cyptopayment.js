'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class CyptoPayment extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  CyptoPayment.init({
    id: {
      allowNull: false,
      primaryKey: true,
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV1,
    },
    user_id: {
      allowNull: true,
      type: DataTypes.UUID,
    },
    amount: {
      allowNull: true,
      type: DataTypes.DECIMAL(65, 0),
      defaultValue: 0,
    },
    customerId: {
      allowNull: true,
      type: DataTypes.STRING
    },
    checkoutId: {
      allowNull: true,
      type: DataTypes.STRING
    },
    url: {
      allowNull: true,
      type: DataTypes.STRING
    },
    status: {
      allowNull: true,
      type: DataTypes.STRING
    },
  }, {
    sequelize,
    modelName: 'CyptoPayment',
    timestamps: true,
    paranoid: true,
    tableName: 'CyptoPayments',
  });
  return CyptoPayment;
};