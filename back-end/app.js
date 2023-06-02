const app = require("express")();
const mongoose = require("mongoose");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
require("dotenv").config();
const authRoute = require("./routes/auth");
const userRoutes = require("./routes/user_route.js");
const courseRoutes = require("./routes/course_route.js");

const expressValidator = require("express-validator");
const port = process.env.port || 3000;

app.use(morgan("dev"));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(expressValidator());

mongoose
  .connect(process.env.data, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log("database connected");
  });

app.use("/auth",authRoute);

app.use("/users", userRoutes);
app.use("/courses", courseRoutes);

app.listen(port, () => {
  console.log(`server running on port ${port}`);
});
