// package imports
const Sequelize = require("sequelize");
const moment = require("moment");

// local imports
const Packages = require("../models").Package;
const Users = require("../models").User;
const Investments = require("../models").Investment;
const History = require('../models').History;
const helpers = require("../helpers/cryptedge_helpers");
const Chats = require("../models").Chat;
const AdminMessages = require('../models').AdminMessage;
// imports initialization
const Op = Sequelize.Op;

exports.addPackage = (req, res, next) => {
    AdminMessages.findAll()
        .then(unansweredChats => {
            res.render("dashboards/add_packages", {
                edit: false,
                messages: unansweredChats,
                moment
            });
        })
        .catch(error => {
            req.flash('error', "Server error!");
            res.redirect("/");
        });
}

exports.usersPackages = (req, res, next) => {
     AdminMessages.findAll()
        .then(unansweredChats => {
            Packages.findAll({
                    where: {
                        deletedAt: {
                            [Op.eq]: null
                        },
                        description: {
                            [Op.eq]: "Bitcoin"
                        }
                    },
                    order: [
                        ['createdAt', 'ASC'],
                    ],
                })
                .then(packages => {
                    Users.findOne({
                        where:{
                            id : {
                                [Op.eq] : req.session.userId
                            }
                        }
                    }).then(user=>{
                        res.render("dashboards/users/packages", {
                            packages: packages,
                            user:user,
                            messages: unansweredChats,
                            moment
                        });
                    }).catch(error=>{
                        res.redirect('/')
                    })
                    
                })
                .catch(error => {
                    res.redirect("/");
                });
        })
        .catch(error => {
            req.flash('error', "Server error!");
            res.redirect("/");
        });
}

exports.usersPackagesEthereum = (req, res, next) => {
    AdminMessages.findAll()
       .then(unansweredChats => {
           Packages.findAll({
                   where: {
                       deletedAt: {
                           [Op.eq]: null
                       },
                       description: {
                        [Op.eq]: "Ethereum"
                       }
                   },
                   order: [
                       ['createdAt', 'ASC'],
                   ],
               })
               .then(packages => {
                   Users.findOne({
                       where:{
                           id : {
                               [Op.eq] : req.session.userId
                           }
                       }
                   }).then(user=>{
                       res.render("dashboards/users/packages", {
                           packages: packages,
                           user:user,
                           messages: unansweredChats,
                           moment
                       });
                   }).catch(error=>{
                       res.redirect('/')
                   })
                   
               })
               .catch(error => {
                   res.redirect("/");
               });
       })
       .catch(error => {
           req.flash('error', "Server error!");
           res.redirect("/");
       });
}

exports.eachPackage = (req, res, next) => {
    const id = req.params.id;
    AdminMessages.findAll()
        .then(unansweredChats => {
            Packages.findOne({
                    where: {
                        id: {
                            [Op.eq]: id
                        }
                    }
                })
                .then(package => {
                    if (package) {
                        res.render("dashboards/users/each_package", {
                            package: package,
                            messages: unansweredChats,
                            moment
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

};


//invest package new
exports.investPackage = (req,res,next)=>{
    let id  = req.body.idd;
    let owner = req.session.userId;
    let amount_p = req.body.amount;
    let type = 'BTC Deposit';
    let desc = 'BTC Investment made';

    Packages.findOne({
        where:{
            id:{
                [Op.eq]:id
            }
        }
    }).then(package=>{
        if(!package){
            req.flash('Warning', 'Invalid package');
            res.redirect('back');
        }else{

            let duration = Math.abs(Number(package.duration));
            let amount = Math.abs(Number(package.price));

            Investments.create({
                user_id:owner,
                package_id:id,
                amount,
                status: 0,
                interest: package.dailyEarning,
                expiredAt: moment().add(duration, 'days')
               

            }).then(investment=>{
                History.create({
                    user_id:req.session.userId,
                    value:amount_p,
                    type,
                    desc
                })
                req.flash('success', "Investment made successfully!");
                res.redirect("back");
            }).catch(error=>{
                req.flash('error', "Unable to create investment!");
                res.redirect("back");
            }).catch(error=>{
                req.flash('error', "Could not add investment!");
                res.redirect("back");
            })
        }
    })
}


// invest in a package
exports.investPackages = (req, res, next) => {
    let id = req.body.idd;
   
    Packages.findOne({
            where: {
                id: {
                    [Op.eq]: id
                }
            }
        })
        .then(package => {
            if (package) {
                let duration = Math.abs(Number(package.duration));
               
                // check details of package if it is greater than max_amt of package 
                // return max amount exceeded
                // if it is less, return min_amt exceeded
                if (!package) {
                    req.flash('warning', "invalid package");
                    res.redirect("back");
                } else {
                    if (amount > maxAmt) {
                        req.flash('warning', "Maximum package limit exeeded");
                        res.redirect("back");
                    }else {
                        Users.findOne({
                                where: {
                                    id: {
                                        [Op.eq]: req.session.userId
                                    }
                                }
                            })
                            .then(user => {
                                if (user) {
                                    // then once it has been found, check users wallet
                                    let wallet = Math.abs(Number(user.wallet));
                                    // if it is not upto amount return insufficient fund
                                    if (amount > wallet) {
                                        req.flash('warning', "Insufficient fund!");
                                        res.redirect("back");
                                    } else {

                                        // before creating the investments, 
                                        //first check if the user has made an investment before now, 
                                        // if he does proceed as usual
                                        // if he does not credit 3% to the referral of this user
                                        // if he exists
                                        Investments.findOne({
                                                where: {
                                                    user_id: {
                                                        [Op.eq]: req.session.userId
                                                    }
                                                }
                                            })
                                            .then(hasInvestment => {
                                                if (hasInvestment) {
                                                    // else add to investment table,
                                                    // then deduct the amount from users wallet
                                                    // then return status of the whole transaction
                                                    Investments.create({
                                                            user_id: req.session.userId,
                                                            package_id: id,
                                                            amount: amount,
                                                            interest: package.interest,
                                                            expiredAt: moment().add(duration, 'days')
                                                        })
                                                        .then(investment => {
                                                            let currentWallet = wallet - amount;
                                                            Users.update({
                                                                    wallet: currentWallet
                                                                }, {
                                                                    where: {
                                                                        id: {
                                                                            [Op.eq]: req.session.userId
                                                                        }
                                                                    }
                                                                })
                                                                .then(newUser => {
                                                                    req.flash('success', "Investment made successfully!");
                                                                    res.redirect("back");
                                                                })
                                                                .catch(error => {
                                                                    req.flash('error', "Unable to make deductions!");
                                                                    res.redirect("back");
                                                                })
                                                        })
                                                        .catch(error => {
                                                            req.flash('error', "Could not add investment!");
                                                            res.redirect("back");
                                                        });
                                                } else {
                                                    // check if this user has referral
                                                    let referral_id = user.referral_id;
                                                    if (referral_id != null && referral_id != "") {
                                                        Users.findOne({
                                                                where: {
                                                                    id: {
                                                                        [Op.eq]: referral_id
                                                                    }
                                                                }
                                                            })
                                                            .then(refdetails => {
                                                                let refWallet = Math.abs(Number(refdetails.wallet));
                                                                let refAmount = amount * 0.03;
                                                                let refCurrentWallet = refWallet + refAmount;
                                                                let amountAsRefferal = Math.abs(Number(refdetails.referral_amount));
                                                                let currentAmountAsRefferal = amountAsRefferal + refAmount;
                                                                Users.update({
                                                                        wallet: refCurrentWallet,
                                                                        referral_amount: currentAmountAsRefferal
                                                                    }, {
                                                                        where: {
                                                                            id: {
                                                                                [Op.eq]: referral_id
                                                                            }
                                                                        }
                                                                    })
                                                                    .then(refupdated => {
                                                                        // else add to investment table,
                                                                        // then deduct the amount from users wallet
                                                                        // then return status of the whole transaction
                                                                        Investments.create({
                                                                                user_id: req.session.userId,
                                                                                package_id: id,
                                                                                amount: amount,
                                                                                interest: package.interest,
                                                                                expiredAt: moment().add(duration, 'days')
                                                                            })
                                                                            .then(investment => {
                                                                                let currentWallet = wallet - amount;
                                                                                Users.update({
                                                                                        wallet: currentWallet
                                                                                    }, {
                                                                                        where: {
                                                                                            id: {
                                                                                                [Op.eq]: req.session.userId
                                                                                            }
                                                                                        }
                                                                                    })
                                                                                    .then(newUser => {
                                                                                        req.flash('success', "Investment made successfully!");
                                                                                        res.redirect("back");
                                                                                    })
                                                                                    .catch(error => {
                                                                                        req.flash('error', "Unable to make deductions!");
                                                                                        res.redirect("back");
                                                                                    })
                                                                            })
                                                                            .catch(error => {
                                                                                req.flash('error', "Could not add investment!");
                                                                                res.redirect("back");
                                                                            });
                                                                    })
                                                                    .catch(error => {
                                                                        req.flash('error', "Server error!");
                                                                        res.redirect("back");
                                                                    });
                                                            })
                                                            .catch(error => {
                                                                req.flash('error', "Server error!");
                                                                res.redirect("back");
                                                            });
                                                    } else {
                                                        // else add to investment table,
                                                        // then deduct the amount from users wallet
                                                        // then return status of the whole transaction
                                                        Investments.create({
                                                                user_id: req.session.userId,
                                                                package_id: id,
                                                                amount: amount,
                                                                interest: package.interest,
                                                                expiredAt: moment().add(duration, 'days')
                                                            })
                                                            .then(investment => {
                                                                let currentWallet = wallet - amount;
                                                                Users.update({
                                                                        wallet: currentWallet
                                                                    }, {
                                                                        where: {
                                                                            id: {
                                                                                [Op.eq]: req.session.userId
                                                                            }
                                                                        }
                                                                    })
                                                                    .then(newUser => {
                                                                        req.flash('success', "Investment made successfully!");
                                                                        res.redirect("back");
                                                                    })
                                                                    .catch(error => {
                                                                        req.flash('error', "Unable to make deductions!");
                                                                        res.redirect("back");
                                                                    })
                                                            })
                                                            .catch(error => {
                                                                req.flash('error', "Could not add investment!");
                                                                res.redirect("back");
                                                            });
                                                    }
                                                }
                                            })
                                            .catch(error => {
                                                req.flash('error', "Server error!");
                                                res.redirect("back");
                                            });
                                    }
                                } else {
                                    req.flash('warning', "User not found!");
                                    res.redirect("back");
                                }
                            })
                            .catch(error => {
                                req.flash('error', "Could not verify user!");
                                res.redirect("back");
                            });
                    }
                }
            } else {
                req.flash('warning', "Invalid package");
                res.redirect("back");
            }
        })
        .catch(error => {
            req.flash('error', "error connecting to server");
            res.redirect("back");
        });


}

exports.editPackage = (req, res, next) => {
    const id = req.params.id;
    AdminMessages.findAll()
        .then(unansweredChats => {
            Packages.findOne({
                    where: {
                        id: {
                            [Op.eq]: id
                        }
                    }
                })
                .then(package => {
                    if (package) {
                        res.render("dashboards/add_packages", {
                            edit: true,
                            package: package,
                            messages: unansweredChats,
                            moment
                        });
                    } else {
                        res.redirect("back");
                    }
                })
                .catch(error => {
                    res.redirect("back");
                });
        })
        .catch(error => {
            req.flash('error', "Server error!");
            res.redirect("back");
        });
}

exports.adminAllPackages = (req, res, next) => {
    AdminMessages.findAll()
        .then(unansweredChats => {
            Packages.findAll({
                    where: {
                        deletedAt: {
                            [Op.eq]: null
                        }
                    },
                    order: [
                        ['createdAt', 'ASC'],
                    ],
                })
                .then(packages => {
                    res.render("dashboards/packages_admin", {
                        packages: packages,
                        messages: unansweredChats,
                        moment
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
}

exports.deletePackage = (req, res, next) => {
    Investments.findOne({
            where: {
                package_id: {
                    [Op.eq]: req.body.id
                }
            }
        })
        .then(investment => {
            console.log(investment);
            if (investment) {
                req.flash('warning', "Package already has investors!");
                res.redirect("back");
            } else {
                Packages.destroy({
                        where: {
                            id: {
                                [Op.eq]: req.body.id
                            }
                        }
                    })
                    .then(response => {
                        req.flash('success', "package deleted successfully");
                        res.redirect("back");
                    })
                    .catch(error => {
                        req.flash('error', "something went wrong");
                        res.redirect("back");
                    });
            }
        })
        .catch(error => {
            req.flash('error', "Server error!");
            res.redirect("back");
        });
}

exports.postAddPackage = (req, res, next) => {
    const {
        name,
        price,
        harsh_power,
        dailyEarning,
        withdrawal,
        duration,
        description
    } = req.body;
    // check if any of them are empty
    if (!name || !price || !harsh_power || !dailyEarning || !withdrawal || !duration || !description) {
        req.flash('warning', "enter all fields");
        res.redirect("back");
    } else if (!helpers.isNumeric(price)) {
        req.flash('warning', "enter valid minimum investment(digits only)");
        res.redirect("back");
    } else if (!helpers.isNumeric(dailyEarning)) {
        req.flash('warning', "enter valid maximum investment(digits only)");
        res.redirect("back");
    }  
    // else if (Math.abs(Number(interest)) > 100) {
    //     req.flash('warning', "Interest must be less than 100%");
    //     res.redirect("back");
    // } 
     else {
        Packages.findOne({
                where: {
                    name: {
                        [Op.eq]: req.body.name
                    },
                    description: {
                        [Op.eq]: req.body.description
                    }
                }
            })
            .then(package => {
                if (package) {
                    req.flash('warning', "name already exists");
                    res.redirect("back");
                } else {
                    Packages.create({
                        name,
                        price,
                        harsh_power,
                        dailyEarning,
                        withdrawal,
                        duration,
                        description
                        })
                        .then(packages => {
                            req.flash('success', "Package added successfully!");
                            res.redirect("back");
                        })
                        .catch(error => {
                            req.flash('error', "Something went wrong!");
                            res.redirect("back");
                        });
                }
            })
            .catch(error => {
                req.flash('error', "something went wrong");
                res.redirect("back");
            });
    }
}

exports.postUpdatePackage = (req, res, next) => {
    const {
        name,
        price,
        harsh_power,
        dailyEarning,
        withdrawal,
        duration,
    } = req.body;
    // check if any of them are empty
    if (!name || !price || !harsh_power || !dailyEarning || !withdrawal || !duration) {
        req.flash('warning', "enter all fields");
        res.redirect("back");
    } else if (!helpers.isNumeric(price)) {
        req.flash('warning', "enter valid price(digits only)");
        res.redirect("back");
    } else if (!helpers.isNumeric(dailyEarning)) {
        req.flash('warning', "enter valid daily earning (digits only)");
        res.redirect("back");
    } 
    // else if (Math.abs(Number(interest)) > 100) {
    //     req.flash('warning', "Interest must be less than or equal to 100%");
    //     res.redirect("back");
    // } 
    else if (!helpers.isNumeric(duration)) {
        req.flash('warning', "enter valid duration(digits only)");
        res.redirect("back");
    } else {
        Packages.findOne({
                where: {
                    id: {
                        [Op.eq]: req.body.id
                    }
                }
            })
            .then(package => {
                if (!package) {
                    req.flash('warning', "Invalid Package");
                    res.redirect("back");
                } else {
                    Packages.update({
                        name,
                        price,
                        harsh_power,
                        dailyEarning,
                        withdrawal,
                        duration,
                        }, {
                            where: {
                                id: {
                                    [Op.eq]: req.body.id
                                }
                            }
                        })
                        .then(packages => {
                            req.flash('success', "Package updated successfully!");
                            res.redirect("back");
                        })
                        .catch(error => {
                            req.flash('error', "Something went wrong!");
                            res.redirect("back");
                        });
                }
            })
            .catch(error => {
                req.flash('error', "something went wrong");
                res.redirect("back");
            });
    }
}