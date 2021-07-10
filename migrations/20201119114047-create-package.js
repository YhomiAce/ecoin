'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Packages', {
      id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV1,
      },
      name: {
        allowNull: true,
        type: Sequelize.STRING
      },
      description: {
        allowNull: true,
        type: Sequelize.TEXT
      },
      dailyEarning: {
        allowNull: true,
        type: Sequelize.DECIMAL(65, 0),
      },
      price: {
        allowNull: true,
        type: Sequelize.DECIMAL(65, 0),
      },
      harsh_power: {
        allowNull: true,
        type: Sequelize.STRING,
      },
      interest: {
        allowNull: true,
        type: Sequelize.DECIMAL(65, 0),
        defaultValue: 0,
      },
      duration: {
        allowNull: true,
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      withdrawal:{
        allowNull: true,
        type: Sequelize.STRING,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      deletedAt: {
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Packages');
  }
};