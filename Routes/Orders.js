const router = require('express').Router();

const orderCtrl = require("../Controllers/Orders");

router.post("/", orderCtrl.create);
router.get("/:uid", orderCtrl.get)

module.exports = router;
