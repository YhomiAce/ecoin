'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Verifications', {
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
      email_status: {
        allowNull: true,
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      twofa_status: {
        allowNull: true,
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      twofa_image: {
        allowNull: true,
        type: Sequelize.TEXT,
        defaultValue: "0",
      },
      email_code: {
        allowNull: true,
        type: Sequelize.TEXT,
      },
      twofa_code: {
        allowNull: true,
        type: Sequelize.TEXT,
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
    await queryInterface.dropTable('Verifications');
  }
};