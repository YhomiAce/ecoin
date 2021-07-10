// package imports
const Sequelize = require("sequelize");
const axios = require('axios');

// local imports
const Withdrawals = require("../models").Withdrawal;
const Users = require("../models").User;
const parameters = require("../config/params");
const auth = require("../config/auth");
const helpers = require("../helpers/cryptedge_helpers");

// imports initialization
const Op = Sequelize.Op;


exports.getBanks = (req, res, next) => {
    axios.get(`${parameters.PAYSTACK_BASEURL}/bank`, {
            headers: auth.header,
        })
        .then(response => {
            if (response.status) {
                res.status(200).json({
                    status: true,
                    message: response.data.message,
                    data: response.data.data
                });
            } else {
                res.status(500).json({
                    status: false,
                    message: "Something went wrong!"
                });
            }
        })
        .catch(error => {
            res.status(500).json({
                status: false,
                message: error
            });
        });
}

exports.verifyAccount = (req, res, next) => {
    let accountNumber = req.body.account;
    let bankCode = req.body.bank_code;
    axios.get(`${parameters.PAYSTACK_BASEURL}/bank/resolve?account_number=${accountNumber}&bank_code=${bankCode}`, {
            headers: auth.header,
        })
        .then(response => {
            if (response.status) {
                res.status(200).json({
                    status: true,
                    message: response.data.message,
                    data: response.data.data
                });
            } else {
                res.status(200).json({
                    status: false,
                    message: "Account not valid"
                });
            }
        })
        .catch(error => {
            res.status(200).json({
                status: false,
                message: "Account not valid"
            });
        });
}

exports.createTransferRecipient = (req, res, next) => {
    let bankName = req.body.bank_name;
    let accountNumber = req.body.account_number;
    let accountName = req.body.account_name;
    let bankCode = req.body.bank_code;
    let amount = req.body.amount;
    let recipient;
    if (!bankName || !accountNumber || !accountName || !bankCode || !amount) {
        res.status(200).json({
            status: false,
            message: "Enter all fields"
        });
    } else if (!helpers.isNumeric(accountNumber)) {
        res.status(200).json({
            status: false,
            message: "Enter valid account number"
        });
    } else if (!helpers.isNumeric(amount)) {
        res.status(200).json({
            status: false,
            message: "Enter valid amount"
        });
    } else {
        Users.findOne({
                where: {
                    id: {
                        [Op.eq]: req.session.userId
                    }
                }
            })
            .then(user => {
                if (user) {
                    let userWallet = Math.abs(Number(user.wallet));
                    amount = Math.abs(Number(amount));
                    let currentWallet = userWallet - amount;
                    if (amount > userWallet) {
                        res.status(200).json({
                            status: false,
                            message: "Insufficient fund"
                        });
                    } else {
                        axios({
                                method: 'post',
                                url: `${parameters.PAYSTACK_BASEURL}/transferrecipient`,
                                data: {
                                    "type": "nuban",
                                    "name": accountName,
                                    "account_number": accountNumber,
                                    "bank_code": bankCode,
                                    "currency": "NGN"
                                },
                                headers: auth.header,
                            })
                            .then(response => {
                                if (response.data.status) {
                                    Users.update({
                                            wallet: currentWallet
                                        }, {
                                            where: {
                                                id: req.session.userId
                                            }
                                        })
                                        .then(updatedUser => {
                                            Withdrawals.create({
                                                    user_id: req.session.userId,
                                                    amount: amount,
                                                    bank: bankName,
                                                    bank_code: bankCode,
                                                    recipient_id: response.data.data.recipient_code,
                                                    acc_name: accountName,
                                                    acc_number: accountNumber
                                                })
                                                .then(withdrawn => {
                                                    res.status(200).json({
                                                        status: true,
                                                        message: "Withdrawal initiated, awaiting admin approval"
                                                    });
                                                })
                                                .catch(error => {
                                                    res.status(200).json({
                                                        status: false,
                                                        message: "Server Error, try again",
                                                    });
                                                });
                                        })
                                        .catch(error => {
                                            res.status(200).json({
                                                status: false,
                                                message: "Server Error, try again",
                                            });
                                        });
                                } else {
                                    res.status(200).json({
                                        status: false,
                                        message: "Could not initiate withdrawal",
                                    });
                                }
                            })
                            .catch(error => {
                                res.status(200).json({
                                    status: false,
                                    message: "Server Error, try again",
                                });
                            });
                    }
                } else {
                    res.status(200).json({
                        status: false,
                        message: "Session expired",
                    });
                }
            })
            .catch(error => {
                res.status(200).json({
                    status: false,
                    message: "Server Error, try again",
                });
            });
    }
}

exports.payWithPaystack = (req, res, next) => {
        id = req.body.id;
        DollarValue.findOne({})
            .then(dollar => {
                Withdrawals.findOne({
                    where: {
                        id: {
                            [Op.eq]: id
                        }
                    }
                })
                .then(withdrawal => {
                    if (withdrawal) {
                        axios({
                                method: 'post',
                                url: `${parameters.PAYSTACK_BASEURL}/transfer`,
                                data: {
                                    "source": "balance",
                                    "amount": withdrawal.amount * Math.abs(parseInt(dollar.amount)),
                                    "recipient": withdrawal.recipient_id,
                                    "reason": `${parameters.APP_NAME} INVESTMENT PAYOUT`
                                },
                                headers: auth.header,
                            })
                            .then(response => {
                                Withdrawals.update({
                                        status: 1
                                    }, {
                                        where: {
                                            id: {
                                                [Op.eq]: id
                                            }
                                        }
                                    })
                                    .then(updatedWithdrawal => {
                                        req.flash('success', "Withdrawal updated successfully");
                                        res.redirect("back");
                                    })
                                    .catch(error => {
                                        req.flash('error', "Server error" + error);
                                        res.redirect("back");
                                    });
                            })
                            .catch(error => {
                                req.flash('error', "Server error" + error);
                                res.redirect("back");
                            });
                    } else {
                        req.flash('error', "Invalid withdrawal");
                        res.redirect("/");
                    }
                })
                .catch(error => {
                    req.flash('error', "Server error" + error);
                    res.redirect("back");
                });
            })
            .catch(error => {
                    req.flash('error', "Server error" + error);
                    res.redirect("back");
            });
                }