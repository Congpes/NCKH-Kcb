import { Router } from "express";
import authController from "../controllers/authControllers";

const router = Router();

//register
router.post("/register", authController.registerUser);

//login
router.post("/login", authController.loginUser);


export default router;