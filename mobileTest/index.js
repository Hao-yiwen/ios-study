const express = require("express");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const cors = require("cors");
const userRoutes = require("./src/userRouter"); // 引入用户路由模块

const app = express();

// 使用中间件
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan("dev"));
app.use(cors());

// 根路由
app.get("/", (req, res) => {
  res.send("Hello World");
});

// 使用用户路由模块
app.use("/api/users", userRoutes); // 所有以 /api/users 开头的路由都会交给 userRoutes 处理

// 启动服务器
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
