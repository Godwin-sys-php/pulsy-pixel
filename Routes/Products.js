const router = require('express').Router();

const productCtrl = require("../Controllers/Products");

router.get("/", productCtrl.getAll);
router.get("/:valueId", productCtrl.getValueDetails)

module.exports = router;
