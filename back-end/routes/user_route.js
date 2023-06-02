const userRoutes = require("express").Router();
const { requireSignin } = require("../controller/auth");
const { userID } = require("../controller/user_controller");

const {
  submitCourseGradeForStudent,
  getUserCourseAndGrades,
  requestCourseGradeChange,
  registerStudentForCourse,
} = require("../controller/user_controller.js");

const {
  isAuthenticated,
  isInstructor,
  isStudent,
} = require("../controller/auth.js");

userRoutes.get("/test/:userID", requireSignin, (req, res) => {
  res.json({
    user: req.profile,
  });
});

// userRoutes.param('userID',userID)

userRoutes.post(
  "/:stdId/courses/:courseId/gradechange",
  isAuthenticated,
  isStudent,
  requestCourseGradeChange
);

userRoutes.post(
  "/:stdId/courses/:courseId/submitgrade",
  isAuthenticated,
  isInstructor,
  submitCourseGradeForStudent
);
userRoutes.get(
  "/:stdId/courses",
  isAuthenticated,
  isStudent,
  getUserCourseAndGrades
);
userRoutes.post(
  "/:stdId/courses/:courseId/register",
  isAuthenticated,
  isStudent,
  registerStudentForCourse
);

module.exports = userRoutes;
