require('dotenv').config();

const mongoose = require("mongoose");
const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const cors = require("cors");

// My routes
const authRoutes = require("./routes/auth");
// const userRoutes = require("./routes/user");
// const categoryRoutes = require("./routes/category");
// const productRoutes = require("./routes/product");
// const orderRoutes = require("./routes/order");
// DB connections
mongoose.connect(process.env.DATABASE, {
   useNewUrlParser:true,
   useUnifiedTopology:true,
   useCreateIndex:true, 
}).then(()=> {
    console.log("DB CONNECTED")
});

app.use(bodyParser.json());
app.use(cookieParser());

// Routes
app.use("/api", authRoutes);
// app.use("/api", userRoutes);
// app.use("/api", categoryRoutes);
// app.use("/api", productRoutes);
// app.use("/api", orderRoutes);
app.use("/home", (req, res)=>{
    res.send("I am home");
})

// MiddleWares


app.use(cors());



// PORT
const port = process.env.WEBSITE || 3000;

// starting the server
app.listen(port, ()=>{
    console.log(`Server is running at ${port}`);
});