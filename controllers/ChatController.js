// package imports
const Sequelize = require("sequelize");
const moment = require('moment');

// local imports
const parameters = require("../config/params");
const Users = require("../models").User;
const Chats = require("../models").Chat;
const AdminMessages = require('../models').AdminMessage
const Admins = require('../models').Admin
const MessageStatus = require('../models').MessageStatus

// imports initialization
const Op = Sequelize.Op;

exports.chatPage = (req, res, next) => {
    //const id = req.params.id;
    const receiverId = req.params.id;
    const userId = req.session.userId;
    // reset all users unread messages to 0
    Chats.update({
            read_status: 1
        }, {
            where: {
                [Op.or]: [{
                        [Op.and]: [{
                            receiver_id: {
                                [Op.eq]: req.session.userId
                            }
                        }, {
                            sender_id: {
                                [Op.eq]: receiverId
                            }
                        }]
                    },
                    {
                        [Op.and]: [{
                            receiver_id: {
                                [Op.eq]: receiverId
                            }
                        }, {
                            sender_id: {
                                [Op.eq]: req.session.userId
                            }
                        }],
                    }
                ],
            }
        })
        .then(updatedChats => {
            Chats.findAll({
                    where: {
                        [Op.and]: [{
                                receiver_id: {
                                    [Op.eq]: req.session.userId
                                }
                            },
                            {
                                read_status: {
                                    [Op.eq]: 0
                                }
                            }
                        ]
                    },
                    include: ["user"],
                })
                .then(unansweredChats => {
                    Users.findOne({
                            where: {
                                id: {
                                    [Op.eq]: receiverId
                                }
                            }
                        })
                        .then(user => {
                            if (user) {

                                // fetch all users chats
                                Chats.findAll({
                                        where: {
                                            [Op.or]: [{
                                                    sender_id: {
                                                        [Op.eq]: receiverId
                                                    }
                                                },
                                                {
                                                    receiver_id: {
                                                        [Op.eq]: receiverId
                                                    }
                                                }
                                            ],
                                        },
                                        order: [
                                            ['createdAt', 'ASC'],
                                        ],
                                    })
                                    .then(chats => {
                                        res.render("dashboards/chat", {
                                            user: user,
                                            userId: userId,
                                            chats: chats,
                                            messages: unansweredChats,
                                            moment
                                        });
                                    })
                                    .catch(error => {
                                        res.redirect("/");
                                    });
                            } else {
                                res.redirect("/");
                            }
                        })
                        .catch(error => {
                            res.redirect("/");
                        });
                })
                .catch(error => {
                    req.flash('error', "Server error!");
                    res.redirect("/");
                });
        })
        .catch(error => {
            res.redirect("/");
        });
},


//admin message form
exports.adminMessage = (req,res,next)=>{
res.render('chatevery')
},

//proces admin message
exports.postAdminMessage = (req, res, next) => {
    const {
        title,
        message,
    } = req.body;

    if (!title) {
        req.flash('warning', "Please enter name");
        res.redirect("back");
    } else if (!message) {
        req.flash('warning', "Please enter email");
        res.redirect("back")
    }
    Admins.findOne({
            where: {
                id: {
                    [Op.eq]: req.session.adminId
                }
            }
        })
        .then((user) => {
            if (user) {
                let title = req.body.title;
                let message = req.body.message;
                AdminMessages.create({
                        title: title,
                        message: message,
                    
                    })
                    .then((response) => {
                        req.flash('success', "Message sent to all users");
                        res.redirect("/dashboard");
                    })

            }
        })
        .catch(error => {
            console.log({ERROR:'something is wrong'})
            req.flash('error', "Something went wrong try again");
            res.redirect("back");
        });
}
// exports.chatnow = (req,res,next)=>{
//     res.render('chatevery')
// },


//ftech all messages by admin

exports.allAdminMessages = (req, res, next) => {
    AdminMessages.findAll()
        .then(messages => {
            Users.findOne({
                where: {
                    id: {
                        [Op.eq]: req.session.userId
                    }
                }
            }).then(user=>{
               
                let messageCount = messages.length
                res.render("adminmessages", {
                    messageCount,
                    user,
                    messages,
                    moment
                });
            })
            
        }).catch(error=>{
            console.log(error)
            req.flash('Warning', 'Something went wrong')
            res.redirect('back')
        }).catch(error=>{
            console.log(error)
            req.flash('Warning', 'Server error, try again')
            res.redirect('back')

        })

    
}



//read admin message
exports.readMessage = (req, res, next) => {
    const id = req.params.id;
    Chats.findAll({
        where: {
            [Op.and]: [{
                receiver_id: {
                    [Op.eq]: req.session.userId
                }
            }, 
            {
                read_status: {
                    [Op.eq]: 0
                }
            }]
            
        },
        include: ["user"],
    })
    .then(unansweredChats => {
        AdminMessages.findOne({
            where: {
                id: {
                    [Op.eq]: id
                },
            },
           
        })
        .then(message => {
            Users.findOne({where:{id:req.session.userId}}).then(user=>{
                MessageStatus.findOne({where:{userId: req.session.userId, messageId: message.id}}).then(msg=>{
                    if (!msg) {
                        MessageStatus.create({userId:req.session.userId, messageId: message.id}).then(status =>{
        
                            res.render("dashboards/users/read_message", {
                                message: message,
                                chats: unansweredChats,
                                messages: unansweredChats,
                                user,
                                moment
                            });
                        })
                        
                    }else{
                        res.render("dashboards/users/read_message", {
                            message: message,
                            chats: unansweredChats,
                            messages: unansweredChats,
                            user,
                            moment
                        });
                    }
                })
            })
            // if (deposits) {
            //     res.render("dashboards/view_bank_deposit", {
            //         deposits: deposits
            //     });
            // } else {
            //     req.flash('error', "Server error!");
            //     res.redirect("/");
            // }
            
        })
        .catch(error => {
            req.flash('error', "Server error!");
            res.redirect("/");
        }); 
    })
    .catch(error => {
        req.flash('error', "Server error!");
        res.redirect("/");
    });
}







exports.userChatPage = (req, res, next) => {
    //const id = req.params.id;
    // reset all users read messages to 1
    Chats.update({
            read_status: 1
        }, {
            where: {
                [Op.and]: [{
                        receiver_id: {
                            [Op.eq]: req.session.userId
                        }
                    }
                    // {
                    //    sender_id: {
                    //        [Op.eq]: req.session.userId
                    //    } 
                    // }
                ],
            }
        })
        .then(updated => {
            let receiverId;
            const userId = req.session.userId;
            Chats.findAll({
                    where: {
                        [Op.and]: [{
                                receiver_id: {
                                    [Op.eq]: req.session.userId
                                }
                            },
                            {
                                read_status: {
                                    [Op.eq]: 0
                                }
                            }
                        ]
                    },
                    include: ["user"],
                })
                .then(unansweredChats => {
                    // find user with admin right, i.e right of one
                    Users.findOne({
                            where: {
                                role: {
                                    [Op.eq]: 1
                                }
                            }
                        })
                        .then(admin => {
                            receiverId = admin.id;
                            Users.findOne({
                                    where: {
                                        id: {
                                            [Op.eq]: userId
                                        }
                                    }
                                })
                                .then(user => {
                                    if (user) {
                                        // fetch all users chats
                                        Chats.findAll({
                                                where: {
                                                    [Op.or]: [{
                                                            sender_id: {
                                                                [Op.eq]: userId
                                                            }
                                                        },
                                                        {
                                                            receiver_id: {
                                                                [Op.eq]: userId
                                                            }
                                                        }
                                                    ],
                                                },
                                                order: [
                                                    ['createdAt', 'ASC'],
                                                ],
                                            })
                                            .then(chats => {
                                                res.render("dashboards/users/user_chat", {
                                                    user: admin,
                                                    userId: userId,
                                                    chats: chats,
                                                    messages: unansweredChats
                                                });
                                            })
                                            .catch(error => {
                                                res.redirect("/");
                                            });
                                    } else {
                                        res.redirect("/");
                                    }
                                })
                                .catch(error => {
                                    res.redirect("/");
                                });
                        })
                        .catch(error => {
                            res.redirect("/");
                        });
                })
                .catch(error => {
                    req.flash('error', "Server error!");
                    res.redirect("/");
                });
        })
        .catch(error => {
            res.redirect("/");
        });
}