let amountInput = document.getElementById("amount");
const digits_only = string => [...string].every(c => '0123456789'.includes(c));

function payWithPaystack() {
    let amount = amountInput.value;
    if (!digits_only(amount) || amount.length < 2) {
        iziToast.warning({
            title: 'Warning!',
            message: 'Invalid amount',
            position: 'bottomRight'
        });
    } else {
        let email = document.getElementById("user_email").value;
        let phone = document.getElementById('user_phone').value;
        let conversionRate = document.getElementById("dollar_rate").innerHTML;
        var handler = PaystackPop.setup({
            key: 'pk_live_1f9ff1a42b0c4dac55f9d2a4588b56f36af394ad',
            email: email,
            amount: amount * 100 * conversionRate, //multiply each amount by 100 to get kobo equivalent
            currency: "NGN",
            ref: '' + Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
            metadata: {
                custom_fields: [{
                    display_name: "Mobile Number",
                    variable_name: "mobile_number",
                    value: phone
                }]
            },
            callback: function (response) {
                let reference = response.reference;
                $.ajax({
                    type: 'POST',
                    url: '/fundwallet',
                    data: {
                        email: email,
                        amount: amount,
                        reference: reference,
                        channel: "PAYSTACK"
                    },
                    success: function(data) {
                        if (data.status == true) {
                            iziToast.success({
                                title: 'Success!',
                                message: 'Wallet funded successfully',
                                position: 'bottomRight'
                            });
                            setTimeout(function () {
                                window.location=window.location;
                            }, 5000); 
                        } else {
                            iziToast.error({
                                title: 'Error!',
                                message: 'Something went wrong',
                                position: 'bottomRight'
                            });    
                        }
                    },
                    error: function () {
                        iziToast.error({
                            title: 'Error!',
                            message: 'Something went wrong',
                            position: 'bottomRight'
                        });
                    }
                });
            },
            onClose: function () {
                iziToast.warning({
                    title: 'Warning!',
                    message: 'Payment closed',
                    position: 'bottomRight'
                });
            }
        });
        handler.openIframe();
    }
}

function payWithCryptos() {
    let amount = amountInput.value;
    if (!digits_only(amount) || amount.length < 2) {
        iziToast.warning({
            title: 'Warning!',
            message: 'Invalid amount',
            position: 'bottomRight'
        });
    } else {
        let email = document.getElementById("user_email").value;
        let phone = document.getElementById('user_phone').value;
        paylot({
            amount: amount,
            key: 'pyt_pk-8a13fd5280a144c1bf419bb5332172fe',
            reference: Date.now() + '' + Math.floor((Math.random() * 1000000000) + 1),
            currency: 'USD',
            payload: {
                type: 'payment',
                subject: 'Cryptedge Wallet Funding',
                email: email,
                sendMail: true
            },
            onClose: function(){
                iziToast.warning({
                    title: 'Warning!',
                    message: 'PAYLOT CRYPTO channel closed',
                    position: 'bottomRight'
                });
            }
        }, (err, tx) => {
            if(err){
                iziToast.warning({
                    title: 'Warning!',
                    message: 'PAYLOT CRYPTO channel encountered an error',
                    position: 'bottomRight'
                });
            }else{
                //Transaction was successful
                let reference = tx.reference;
                let amountPaid = tx.amount;
                $.ajax({
                    type: 'POST',
                    url: '/fundwallet',
                    data: {
                        email: email,
                        amount: amountPaid,
                        reference: reference,
                        channel: "PAYLOT CRYPTO"
                    },
                    success: function(data) {
                        if (data.status == true) {
                            iziToast.success({
                                title: 'Success!',
                                message: 'Wallet funded successfully',
                                position: 'bottomRight'
                            });
                            setTimeout(function () {
                                window.location=window.location;
                            }, 5000); 
                        } else {
                            iziToast.error({
                                title: 'Error!',
                                message: 'Something went wrong',
                                position: 'bottomRight'
                            });    
                        }
                    },
                    error: function () {
                        iziToast.error({
                            title: 'Error!',
                            message: 'Something went wrong',
                            position: 'bottomRight'
                        });
                    }
                });
            }
        });  
    }
}

function payWithCryptos2() {
    let amount = amountInput.value;
    if (!digits_only(amount) || amount.length < 2) {
        iziToast.warning({
            title: 'Warning!',
            message: 'Invalid amount',
            position: 'bottomRight'
        });
    } else {
        $.ajax({
            type: 'POST',
            url: '/createcheckout',
            data: {
                amount: amount,
            },
            success: function(data) {
                if (data.status == true) {
                    iziToast.success({
                        title: 'Success!',
                        message: "Processing checkout",
                        position: 'bottomRight'
                    });
                    //console.log(data);
                    setTimeout(function () {
                        window.location= data.url;
                    }, 5000); 
                    
                } else {
                    iziToast.error({
                        title: 'Error!',
                        message: data.message,
                        position: 'bottomRight'
                    });    
                }
            },
            error: function () {
                iziToast.error({
                    title: 'Error!',
                    message: 'Something went wrong',
                    position: 'bottomRight'
                });
            }
        });     
    }
}