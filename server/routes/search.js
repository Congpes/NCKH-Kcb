// routes/search.js
import { Router } from "express";
import { searchDoctors } from "../controllers/searchController.js";

const router = Router();

// GET /search?kw=&hospital=&dept=&price=&rating=&page=&limit=
router.get("/", searchDoctors);

export default router;