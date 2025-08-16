// server/app.js
import express from "express";
import cors from "cors";

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(express.json());

// API v1
app.get("/api/v1/hello", (req, res) => {
  res.json({ message: "Hello from API v1 " });
});

app.post("/api/v1/echo", (req, res) => {
  res.json({
    received: req.body,
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:3000`);
});
