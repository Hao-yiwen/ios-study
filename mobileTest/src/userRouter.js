const express = require("express");
const router = express.Router();

// 示例用户数据
const users = [
  { id: 1, name: "John Doe", email: "john@example.com", age: 25 },
  { id: 2, name: "Jane Doe", email: "jane@example.com", age: 30 },
];

// 获取所有用户
router.get("/", (req, res) => {
  setTimeout(() => {
    res.json(users);
  }, 2000);
});

// 获取指定用户
router.get("/:id", (req, res) => {
  const user = users.find(u => u.id === parseInt(req.params.id));
  if (user) {
    res.json(user);
  } else {
    res.status(404).json({ message: "User not found" });
  }
});

// 创建新用户
router.post("/", (req, res) => {
  const newUser = {
    id: users.length + 1,
    name: req.body.name,
    email: req.body.email,
    age: req.body.age
  };
  users.push(newUser);
  res.status(201).json({ message: "User created", user: newUser });
});

// 更新用户
router.put("/:id", (req, res) => {
  const user = users.find(u => u.id === parseInt(req.params.id));
  if (user) {
    user.name = req.body.name;
    user.email = req.body.email;
    user.age = req.body.age;
    res.json({ message: "User updated", user });
  } else {
    res.status(404).json({ message: "User not found" });
  }
});

// 删除用户
router.delete("/:id", (req, res) => {
  const index = users.findIndex(u => u.id === parseInt(req.params.id));
  if (index !== -1) {
    users.splice(index, 1);
    res.json({ message: `User with id ${req.params.id} deleted` });
  } else {
    res.status(404).json({ message: "User not found" });
  }
});

module.exports = router;