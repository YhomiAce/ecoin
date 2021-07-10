// package imports
const Sequelize = require("sequelize");

// local imports
const Chats = require("../models").Chat;
const CryptBank = require("../models").CryptBank;
const DollarValue = require("../models").DollarValue;
const helpers = require("../helpers/cryptedge_helpers");
// imports initialization
const Op = Sequelize.Op;


const digits_only = string => [...string].every(c => '0123456789'.includes(c));

exports.dollarPage = (req, res, next) => {
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
        DollarValue.findOne({})
        .then(dollar => {
            res.render("dashboards/dollar_page", {
                messages: unansweredChats,
                dollar: dollar
            });
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

exports.postUpdateDollar = (req, res, next) => {
    const {amount} = req.body;
    if (!amount) {
        req.flash('warning', "Please enter amount");
        res.redirect("back");
    } else if(!helpers.isNumeric(amount)) {
        req.flash('warning', "Please enter a valid amount");
        res.redirect("back");
    } else {
        DollarValue.update({
         amount: amount,   
        }, {
            where: {
                deletedAt: null
            }
        })
        .then(updatedDollar => {
            req.flash('success', "Dollar updated successfully!");
        res.redirect("back");
        })
        .catch(error => {
            req.flash('error', "Server error!");
        res.redirect("back");
        })
    }

}

exports.cryptBank = (req, res, next) => {
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
        CryptBank.findOne({})
        .then(bank => {
            res.render("dashboards/bank_details", {
                messages: unansweredChats,
                bank: bank
            });
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

exports.postUpdateBank = (req, res, next) => {
    const {bank, acc_name, acc_num} = req.body;
    if(!bank || !acc_name || !acc_num) {
        req.flash('warning', "Enter all fields");
        res.redirect("back"); 
    } else {
        CryptBank.update({
            bank_name: bank,
            acc_name: acc_name,
            acc_number: acc_num
        },{
            where: {
                deletedAt: null
            }
        })
        .then(updated => {
            req.flash('success', "Bank Details updated successfully!");
            res.redirect("back");
        })
        .catch(error => {
            req.flash('error', "Server error!");
            res.redirect("back");
        });
    }
}