const Course = require("../models/course_model.js");
const User = require("../models/user.js");

exports.userID = (req, res, next, _id) => {
  User.findById({ _id }).then(function (user, error) {
    console.log(error, user);
    if (!user || error) {
      return res.status(403).json({ error: error });
    }
    req.profile = user;
    next();
  });
};

// Register a student for a course
exports.registerStudentForCourse = async (req, res) => {
  try {
    const courseId = req.params.courseId;
    const stdId = req.params.stdId;

    const course = await Course.findById(courseId);
    if (!course) {
      return res.status(404).json({ message: "Course not found" });
    }

    const user = await User.findById(stdId);
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Check if the user is already registered for the course
    if (user.coursesToTake.includes(courseId)) {
      return res
        .status(400)
        .json({ message: "You have already registered for the course" });
    }

    // Add the course to the user's coursesToTake array
    user.coursesToTake.push(courseId);
    await user.save();

    res.json({ message: "You have successfully registered for the course" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};



// Submit course grade
exports.submitCourseGradeForStudent=async(req, res)=> {
  try {
    const courseId = req.params.courseId;
    const stdId = req.params.stdId;

    const { mark, letterGrade } = req.body;

    const user = await User.findById(stdId);
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    const course = user.coursesToTake.find(
      (course) => course._id.toString() === courseId
    );
    if (!course) {
      return res.status(404).json({ message: "Course not found" });
    }

    // save the course grade
    course.mark = mark;
    course.letterGrade = letterGrade;
    await user.save();

    res.json({ message: "Course grade submitted" });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
}

// Get user grades
exports.getUserCourseAndGrades=async(req, res)=> {
  try {
    const stdId = req.params.stdId;
    const user = await User.findById(stdId).populate("coursesToTake");
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    res.json({ courses: user.coursesToTake });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
}

// Request to change course grade
exports.requestCourseGradeChange=async(req, res)=> {
  try {
    const stdId = req.params.stdId;
    const courseId = req.params.courseId;
    const { mark, letterGrade } = req.body;

    //TODO:  implement the logic for handling the grade change request

    res.json({ message: "Grade change request submitted" });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
}
