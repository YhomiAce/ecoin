'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('CryptBanks', {
      id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV1,
      },
      bank_name: {
        allowNull: true,
        type: Sequelize.STRING,
      },
      acc_name: {
        allowNull: true,
        type: Sequelize.STRING,
        defaultValue: "0",
      },
      acc_number: {
        allowNull: true,
        type: Sequelize.STRING,
        defaultValue: "0",
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
    await queryInterface.dropTable('CryptBanks');
  }
};