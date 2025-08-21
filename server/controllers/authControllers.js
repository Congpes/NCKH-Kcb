import * as Usermodel from "../models/user.js";
import bcrypt from "bcrypt";

//const creUser = await Usermodel.createUser(username);
const authController = {
  // register
  registerUser: async (req, res) => {
    try {
        //hash password
        const salt = await bcrypt.genSalt(10);
        const hashed = await bcrypt.hash(req.body.password, salt);

        //tao user moi
        
        //ktra user da ton tai?

        //tra ve res

    } catch (error) {
        res.status(500).json(err);
    }
  },

  //login
  loginUser: async (req, res) =>{
    try {
      
    } catch (error) {
      res.status(500).json(err);
    }
  }
}



export default authController;