const jwt = require("jsonwebtoken");
const conn = require("../connection/dbConnection").promise();

exports.getUser = async (req, res, next) => {
  try {
    const theToken = req.headers.authorization.split(" ")[1];
    const decoded = jwt.verify(theToken, "the-super-strong-secret");
    
    const [row] = await conn.execute(
      "SELECT `id`,`name`,`email` FROM `users` WHERE `id`=?",
      [decoded.id]
    );

    if (row.length > 0) {
      return res.json({
        user: row[0],
      });
    }

    res.json({
      message: "No user found",
    });
  } catch (err) {
    next(err);
  }
};
