const express = require("express");

const {
  createCourse,
  deleteCourse,
  updateCourse,
  getCourse,
  getAllCourse,
} = require("../controller/course_controller.js");

const { isAdmin, isAuthenticated } = require("../controller/auth.js");

const courseRoute = express.Router();

courseRoute.post("/", isAuthenticated, isAdmin, createCourse);

courseRoute.get("/:courseId", isAuthenticated, isAdmin, getCourse);

courseRoute.get("/", isAuthenticated, isAdmin, getAllCourse);

courseRoute.post("/:courseId", isAuthenticated, isAdmin, deleteCourse);

courseRoute.put("/:courseId", isAuthenticated, isAdmin, updateCourse);

module.exports = courseRoute;
