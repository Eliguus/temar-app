//for signup
const User = require("../models/user");
const { errorHandler } = require("../helper/dbErrorHandler");

//for signin
const jwt = require("jsonwebtoken");
const expressJwt = require("express-jwt");

exports.signup = (req, res) => {
  const user = User(req.body);
  console.log(req.body);
  user
    .save()
    .then(() => {
      user.password = undefined;
      res.json({ user });
    })
    .catch((err) => res.status(400).json({ err: errorHandler(err) }));
};

exports.signin = (req, res) => {
  const { email, password } = req.body;
  User.findOne({ email }).then(function (user, error) {
    if (error || !user) {
      return res.status(400).json({ errs: error, err: "no user as such" });
    } else {
      user.comparePassword(password, function (matchError, isMatch) {
        if (matchError || !isMatch) {
          return res.status(401).json({ err: "dont match" });
        }

        const token = jwt.sign({ _id: user._id }, process.env.jwt_token);
        res.cookie("t", token, { expire: new Date() + 99999 });

        const { _id, name, email, role } = user;
        return res.json({ token, user: { _id, name, email, role } });
      });
    }
  });
};

exports.signout = (req, res) => {
  res.clearCookie("t");
  res.json({ message: "done" });
};

exports.requireSignin = expressJwt({
  secret: process.env.jwt_token,
  algorithms: ["HS256"],
  userProperty: "auth",
});


exports.isAuthenticated=(req, res, next) =>{
  console.log(req.headers)
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (!token) {
    return res.status(401).json({ message: "Unauthorized" });
  }

  jwt.verify(token, process.env.jwt_token, async (err, decoded) => {
    if (err) {
      return res.status(403).json({ message: "Invalid token" });
    }
console.log(decoded)
    try {
      const user = await User.findById(decoded._id);
      if (!user) {
        return res.status(404).json({ message: "User not found" });
      }
      // to make the user object available in the request
      req.user = user;
      
      next();
    } catch (error) {
      
      res.status(500).json({ message: "Internal server error" });
    }
  });
}

// changed req.profile.role ===0 to !req.user.isAdmin
// and notadmin to Unauthorized
exports.isAdmin = (req, res, next) => {
  if (!req.user.isAdmin) {
    return res.status(403).json({ err: "Unauthorized" });
  }
  
  next();
};



exports.isAuth = (req, res, next) => {
  console.log(req.profile);
  console.log(req.auth);
  let user = req.profile && req.auth && req.profile._id === req.auth._id;
  if (user) {
    return res.status(403).json({ err: "Not authenticated" });
  }
 
  next();
};

exports.list = (req, res) => {
  User.find({ role: 0 }).then((data, err) => {
    if (!data || err) {
      return res.status(400).json({ err: "cant list users" });
    }

    res.json({ data });
  });
};
// added isInstructor to check whether the user is an instructor or not
exports.isInstructor = (req, res, next) => {
  if (!req.user.isInstructor) {
    return res.status(403).json({ err: "Unauthorized" });
  }

  next();
};
exports.isStudent = (req, res, next) => {
  if (req.user.isInstructor || req.user.isAdmin) {
    return res.status(403).json({ err: "Unauthorized" });
  }

  next();
};
