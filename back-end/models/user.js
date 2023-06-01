const mongoose = require("mongoose");
const uuidv1 = require("uuidv1");
const crypto = require("crypto");
const bcrypt = require("bcryptjs");

const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      trim: true,
      maxlength: 20,
      required: true,
    },

    email: {
      type: String,
      trim: true,
      maxlength: 30,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    },
    isAdmin: {
      default: false,
      type: Boolean,
    },
    isInstructor: {
      default: false,
      type: Boolean,
    },
    // salt:String,
    // role:{
    //     type:Number,
    //     default:0
    // },
  },
  { timestamps: true }
);

userSchema.pre("save", function (next) {
  const user = this;

  if (this.isModified("password") || this.isNew) {
    bcrypt.genSalt(10, function (saltError, salt) {
      if (saltError) {
        return next(saltError);
      } else {
        bcrypt.hash(user.password, salt, function (hashError, hash) {
          if (hashError) {
            return next(hashError);
          }

          user.password = hash;
          next();
        });
      }
    });
  } else {
    return next();
  }
});

userSchema.methods.comparePassword = function (password, callback) {
  bcrypt.compare(password, this.password, function (error, isMatch) {
    if (error) {
      return callback(error);
    } else {
      callback(null, isMatch);
    }
  });
};

module.exports = mongoose.model("User", userSchema);
