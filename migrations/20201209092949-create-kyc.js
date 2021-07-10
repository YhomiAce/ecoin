'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Kycs', {
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
      type: {
        allowNull: true,
        type: Sequelize.STRING,
        defaultValue: 0,
      },
      image: {
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
    await queryInterface.dropTable('Kycs');
  }
};