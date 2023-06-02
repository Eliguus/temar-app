const mongoose = require("mongoose");

const courseSchema = new mongoose.Schema({
  name: { type: String, required: true },
  courseCode: { type: String, required: true },
  mark: { type: Number },
  letterGrade: { type: String},
});

const Course = mongoose.model("Course", courseSchema);

module.exports = Course;
