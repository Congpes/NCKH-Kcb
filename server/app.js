// server/app.js
import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import pool from "./db.js"
import * as authRoute from "./routes/auth.js";
import * as searchRoutes from "./routes/search.js";


dotenv.config();
const app = express();


const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(cookieParser());
app.use(express.json());

// route test 
app.get("/test-db", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT NOW() as now");
    console.log("Kết nối thành công:", rows[0].now);
    res.json({ message: "DB OK", time: rows[0].now });
  } catch (err) {
    console.error("Lỗi kết nối DB:", err.message);
    res.status(500).json({ error: "DB connection failed" });
  }
});

// routes
app.use("/v1/auth",authRoute);

//searchRoutes
app.use("/search", searchRoutes);


// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});


//authentication

//authorization