const express = require("express");
const bodyParser = require("body-parser");
const xss = require('xss');
const _ = require('lodash');
const path = require('path');
const productsRouter = require("./Routes/Products");
const ordersRouter = require("./Routes/Orders");

const app = express();

const server = require('http').Server(app);


app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));
app.use(bodyParser.json({limit: '50mb', extended: true}));

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
  next();
});

app.use((req, res, next) => {
  if (Object.keys(req.body).length > 0) {
    for (let index in req.body) {
      if (_.isString(req.body[index])) {
        req.body[index] = req.body[index].trim();
        req.body[index] = xss(req.body[index]);
      }
    }
    next();
  } else {
    next();
  }
});

app.use(express.static(__dirname + '/dist'));
app.use("/api/products", productsRouter);
app.use("/api/orders", ordersRouter);

app.get('*', (req, res) => {
  res.sendFile(__dirname + '/dist/index.html');
});

server.listen(4200, function () {
  console.debug(`listening on port 4200`);
});