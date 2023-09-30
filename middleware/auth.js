const jwt = require("jsonwebtoken");

const verifyToken = (req, res, next) => {
  if (!req.headers.authorization || !req.headers.authorization.startsWith("Bearer") || !req.headers.authorization.split(" ")[1] ) {
    return res.status(401).json({
      message: "Please provide the token",
    });
  }
  const theToken = req.headers.authorization.split(" ")[1];
  
  if (!theToken) {
    return res.status(401).send("A token is required for authentication");
  }
  
  try {
    const decoded = jwt.verify(theToken, "the-super-strong-secret");
    req.user = decoded;
  } catch (err) {
    return res.status(401).json({
        message: err.message,
    });
  }
  return next();
};

module.exports = verifyToken;
