const Course = require("../models/course_model.js");
const User = require("../models/user.js");

// Create a new course
async function createCourse(req, res) {
  try {
    const { name, courseCode } = req.body;

    const courseExists = await Course.findOne({ courseCode });
    if (courseExists) {
      return res.status(400).json({ message: "Course already exists" });
    }

    const course = new Course({
      name,
      courseCode,
    });

    await course.save();

    res.json({ message: "Course created successfully", course });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
}

// Get a particular course
async function getCourse(req, res) {
  try {
    const courseId = req.params.courseId;

    const course = await Course.findById(courseId);
    if (!course) {
      return res.status(404).json({ message: "Course not found" });
    }

    return res.json({ course });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
}

// Get all courses
async function getAllCourse(req, res) {
  console.log("begin");
  try {
    console.log("should work");
    const courses = await Course.find({});
    res.json({ courses });
  } catch (error) {
    console.log("an error");
    res.status(500).json({ message: "Internal server error" });
  }
}

// Delete a course
async function deleteCourse(req, res) {
  try {
    const courseId = req.params.courseId;

    const course = await Course.findByIdAndRemove(courseId);
    if (!course) {
      return res.status(404).json({ message: "Course not found" });
    }

    return res.json({ message: "Course deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
}

// Update a course
async function updateCourse(req, res) {
  try {
    const courseId = req.params.courseId;
    const { name, courseCode } = req.body;

    const course = await Course.findById(courseId);
    if (!course) {
      return res.status(404).json({ message: "Course not found" });
    }

    // Update the course fields
    course.name = name;
    course.courseCode = courseCode;

    await course.save();

    res.json({ message: "Course updated successfully", course });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
}

module.exports = {
  createCourse,
  deleteCourse,
  updateCourse,
  getCourse,
  getAllCourse,
};
