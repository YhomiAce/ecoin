const { userInvestments } = require("./InvestmentController");
const { usersPackages } = require("./PackageController");

exports.investPackage = (req,res,next)=>{
    let id  = req.body.idd;
    let owner = req.session.userId

    usersPackages.findOne({
        where:{
            id:{
                [Op.eq]:id
            }
        }
    }).then(package=>{
        if(!package){
            req.flash('Warning', 'Invalid package')
            res.redirect('back')
        }else{
            let duration = Math.abs(Number(package.duration));
            userInvestments.create({
                user_id:owner,
                package_id:id,
                expiredAt:moment().add(duration, 'days')

            }).then(investment=>{
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