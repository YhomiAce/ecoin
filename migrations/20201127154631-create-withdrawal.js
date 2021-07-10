'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Withdrawals', {
      id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV1,
      },
      user_id: {
        allowNull: true,
        type: Sequelize.UUID,
      },
      amount: {
        allowNull: true,
        type: Sequelize.DECIMAL(65, 0),
        defaultValue: 0,
      },
      bank: {
        allowNull: true,
        type: Sequelize.TEXT,
      },
      bank_code: {
        allowNull: true,
        type: Sequelize.TEXT,
      },
      recipient_id: {
        allowNull: true,
        type: Sequelize.TEXT,
      },
      acc_name: {
        allowNull: true,
        type: Sequelize.TEXT,
      },
      acc_number: {
        allowNull: true,
        type: Sequelize.TEXT,
      },
      status: {
        allowNull: true,
        type: Sequelize.INTEGER,
        defaultValue: 0,
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
    await queryInterface.dropTable('Withdrawals');
  }
};