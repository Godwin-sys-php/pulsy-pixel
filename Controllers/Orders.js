const { v4: uuidv4 } = require("uuid");
const moment = require("moment");
const Orders = require("../Models/Orders");
const Products = require("../Models/Products");
const ProductValues = require("../Models/ProductValues");
const Regions = require("../Models/Regions");

exports.create = async (req, res) => {
  try {
    const now = moment();
    const toInsert = {
      uid: uuidv4(),
      timestamp: now.unix(),
    };
    const inserted = await Orders.insertOne(toInsert);
    let total = 0;

    for (let index in req.body.products) {
      const el = req.body.products[index];
      const valueData = await ProductValues.findOne({ value_id: el.id });

      const productData = await Products.findOne({
        product_id: valueData[0].product_id,
      });
      const regionData = await Regions.findOne({
        region_id: valueData[0].region_id,
      });

      await Orders.customQuery(
        "INSERT INTO OrdersItem SET orderId = ?, name = ?, image = ?, regionName = ?, regionCurrency = ?, color = ?, flag = ?, sellingPrice = ?, value = ?",
        [
          inserted.insertId,
          productData[0].name,
          productData[0].image,
          regionData[0].name,
          regionData[0].currency,
          regionData[0].color,
          regionData[0].flag,
          valueData[0].selling_price,
          valueData[0].value,
        ]
      );
      total+=valueData[0].selling_price
    }

    await Orders.updateOne({ total: total, }, {id: inserted.insertId});

    return res.status(200).json({ success: true, uid: toInsert.uid });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.get = async (req, res) => {
  try {
    const uid = req.params.uid;
    const order = await Orders.findOne({ uid: uid });
    if (order.length === 0) {
      return res
        .status(500)
        .json({ error: true, message: "Commande introuvable" });
    }
    const data = await Orders.customQuery(
      "SELECT * FROM OrdersItem WHERE orderId = ?",
      [order[0].id]
    );
    const sum = await Orders.customQuery(
      "SELECT sum(sellingPrice) as sum FROM OrdersItem WHERE orderId = ?",
      [order[0].id]
    );
    return res.status(200).json({ success: true, data, total: sum[0].sum });
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};
