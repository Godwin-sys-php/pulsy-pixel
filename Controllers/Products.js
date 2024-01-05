const Products = require("../Models/Products"); // Assurez-vous que le chemin est correct

exports.getAll = async (req, res) => {
  try {
    // Requête SQL pour joindre les tables
    const query = `
    SELECT 
    p.name as productName, p.image as imageUrl, r.name as regionName, r.currency, r.color, r.flag,
    pv.value, pv.value_in_dollar, pv.selling_price, pv.value_id as valueId
  FROM 
    Products p
  JOIN 
    ProductValues pv ON p.product_id = pv.product_id
  JOIN 
    Regions r ON pv.region_id = r.region_id
  WHERE 
    p.product_id = 1;
  `;

    const results = await Products.customQuery(query, []);

    let response = {};
    results.forEach((row) => {
      if (!response[row.productName]) {
        response[row.productName] = {
          imageUrl: row.imageUrl,
          regions: [],
        };
      }
      let region = response[row.productName].regions.find(
        (r) => r.region === row.regionName
      );
      if (!region) {
        region = {
          region: row.regionName,
          currency: row.currency,
          color: row.color,
          flag: row.flag,
          values: [],
        };
        response[row.productName].regions.push(region);
      }
      region.values.push({
        valueId: row.valueId,
        value: row.value,
        valueInDollar: row.value_in_dollar,
        sellingPrice: row.selling_price,
      });
    });

    return res.status(200).json({success: true, data: response});
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.getValueDetails = async (req, res) => {
  try {
    const valueId = req.params.valueId; // Assurez-vous que cette valeur est récupérée correctement de la requête

    const query = `
      SELECT 
        p.name as productName, p.image as imageUrl, r.name as regionName, r.currency, r.color, r.flag,
        pv.value_id, pv.value, pv.value_in_dollar, pv.selling_price
      FROM 
        ProductValues pv
      JOIN 
        Products p ON pv.product_id = p.product_id
      JOIN 
        Regions r ON pv.region_id = r.region_id
      WHERE 
        pv.value_id = ?;
    `;

    const results = await Products.customQuery(query, [valueId]);

    if (results.length === 0) {
      return res.status(404).json({ error: true, message: "Aucune donnée trouvée pour cet ID de valeur" });
    }

    const detail = results[0]; // Puisqu'il y aura un seul résultat pour un ID de valeur spécifique

    const response = {
      productName: detail.productName,
      imageUrl: detail.imageUrl,
      region: {
        name: detail.regionName,
        currency: detail.currency,
        color: detail.color,
        flag: detail.flag
      },
      value: {
        id: detail.value_id,
        amount: detail.value,
        valueInDollar: detail.value_in_dollar,
        sellingPrice: detail.selling_price
      }
    };

    return res.status(200).json({success: true, data: response});
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};
