// package imports
const Sequelize = require("sequelize");

// local imports
const Users = require("../models").User;
const Chats = require("../models").Chat;
const AdminMessages = require("../models").AdminMessage;

// imports initialization
const Op = Sequelize.Op;



exports.allUsers = (req, res, next) => {
     AdminMessages.findAll()
    .then(unansweredChats => {
        Users.findAll({
            where: {
                [Op.and]: [{
                        deletedAt: {
                            [Op.eq]: null
                        }
                    },
                    {
                        [Op.or]: [{
                                role: {
                                    [Op.eq]: 2
                                }
                            },
                            {
                                role: {
                                    [Op.eq]: 3
                                }
                            }
                        ]
                    }
                ]
            },
            order: [
                ['name', 'ASC'],
                ['createdAt', 'DESC'],
            ],
        })
        .then(users => {
            res.render("dashboards/all_users", {
                users: users,
                messages: unansweredChats
            });
        })
        .catch(error => {
            res.redirect("/home");
        });
    })
    .catch(error => {
        req.flash('error', "Server error!");
        res.redirect("/");
    });
    
}

exports.viewDeletedUsers = (req, res, next) => {
     AdminMessages.findAll()
    .then(unansweredChats => {
        Users.findAll({
            where: {
                deletedAt: {
                    [Op.ne]: null
                }
            },
                paranoid: false,
            })
            .then(users => {
                res.render("dashboards/deleted_users", {
                    users: users,
                    messages: unansweredChats
                });
            })
            .catch(error => {
                res.redirect("/home");
            });
    })
    .catch(error => {
        req.flash('error', "Server error!");
        res.redirect("/");
    });
}

exports.deleteUser = (req, res, next) => {
    Users.destroy({
            where: {
                id: {
                    [Op.eq]: req.body.id
                }
            }
        })
        .then(response => {
            req.flash('success', "User deleted successfully");
            res.redirect("back");
        })
        .catch(error => {
            req.flash('error', "something went wrong");
            res.redirect("back");
        });
}

exports.restoreUser = (req, res, next) => {
    Users.restore({
            where: {
                id: {
                    [Op.eq]: req.body.id
                }
            }
        })
        .then(response => {
            req.flash('success', "User deleted successfully");
            res.redirect("back");
        })
        .catch(error => {
            req.flash('error', "something went wrong");
            res.redirect("back");
        });
}