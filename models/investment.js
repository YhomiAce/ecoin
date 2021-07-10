'use strict';
const {
  Model
} = require('sequelize');
const dayjs = require("dayjs");

module.exports = (sequelize, DataTypes) => {
  class Investment extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Investment.belongsTo(models.Package, {
        foreignKey: "package_id",
        as: "package",
      });
      Investment.belongsTo(models.User, {
        foreignKey: "user_id",
        as: "user",
      });
    }

  }
  
  Investment.init({
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
    package_id: {
      allowNull: true,
      type: DataTypes.UUID,
    },
    status: {
      allowNull: true,
      type: DataTypes.INTEGER,
    },
    amount: {
      allowNull: true,
      type: DataTypes.DECIMAL(65, 0),
      defaultValue: 0,
    },
    interest: {
      allowNull: true,
      type: DataTypes.DECIMAL(65, 0),
      defaultValue: 0,
    },
    expiredAt: {
      allowNull: false,
      type: DataTypes.DATE,
      get() {
        return dayjs(this.getDataValue('expiredAt')).format('ddd, MMM D, YYYY, h:mm A');
      }
    },
    createdAt: {
      allowNull: false,
      type: DataTypes.DATE,
      get() {
        return dayjs(this.getDataValue('createdAt')).format('ddd, MMM D, YYYY, h:mm A');
      }
    }
  }, {
    sequelize,
    modelName: 'Investment',
    timestamps: true,
    paranoid: true,
    tableName: 'Investments',
  });
  return Investment;
};