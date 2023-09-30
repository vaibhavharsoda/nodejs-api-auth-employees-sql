const router = require("express").Router();
const { body } = require("express-validator");
const { register } = require("../controllers/registerController");
const { login } = require("../controllers/loginController");
const { getUser } = require("../controllers/getUserController");
const employeeController = require('../controllers/employeeController');
const auth = require("../middleware/auth");

router.post("/register", [
    body("name", "The name must be of minimum 3 characters length")
      .notEmpty()
      .escape()
      .trim()
      .isLength({ min: 3 }),
    body("email", "Invalid email address").notEmpty().escape().trim().isEmail(),
    body("password", "The Password must be of minimum 4 characters length")
      .notEmpty()
      .trim()
      .isLength({ min: 4 }),
  ], register);

router.post("/login", [
    body("email", "Invalid email address").notEmpty().escape().trim().isEmail(),
    body("password", "The Password must be of minimum 4 characters length")
      .notEmpty()
      .trim()
      .isLength({ min: 4 }),
  ], login);

router.get("/getuser", auth, (getUser));

router.get('/employees', auth, employeeController.listEmployees);
router.post('/employees',[
      body("name",'Name field must be required').notEmpty(),
      body("jobTitle", "jobTitle field must be required").notEmpty()
    ], auth, employeeController.createEmployee);

router.get('/employees/:id', auth, employeeController.getEmployee);
router.put('/employees/:id', auth, employeeController.updateEmployee);
router.delete('/employees/:id', auth, employeeController.deleteEmployee); 


/* 404 */
router.use("*", (req, res) => {
  res.status(404).json({
    success: "false",
    message: "Page not found",
    error: {
      statusCode: 404,
      message: "You reached a route that is not defined on this server",
    },
  });
});
module.exports = router;
