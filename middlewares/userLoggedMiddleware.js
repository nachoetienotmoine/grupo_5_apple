function userLoggedMiddleware(req, res, next) {
    res.locals.isLogged = false;

    if (req.session.userLogged) {
        res.locals.isLogged = true;
        res.locals.userLogged = req.session.userLogged;
    }

    //let emailInCookie = req.cookies.userEmail;
    //console.log(emailInCookie);
// cambiar , por error //
    next();
}

module.exports = userLoggedMiddleware;