'use strict';
const {
  Model
} = require('sequelize');
const dayjs = require("dayjs");
module.exports = (sequelize, DataTypes) => {
  class History extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      History.belongsTo(models.User, {
        foreignKey: "user_id",
        as: "user",
      });
    }
  }
  History.init({
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
    type:{
        allowNull: true,
        type: DataTypes.STRING,
    },
    value:{
      allowNull: true,
      type: DataTypes.INTEGER,
  },
    desc:{
        allowNull: true,
        type:DataTypes.TEXT
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
    modelName: 'History',
    timestamps: true,
    paranoid: true,
    tableName: 'Histories',
  });
  return History;
};