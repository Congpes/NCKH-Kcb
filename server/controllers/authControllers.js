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
        
        const {username, password ,roleId = 3} = req.body;
        //ktra user da ton tai?
        const existingUser = await Usermodel.getUserByUsername(username);
        if (existingUser) {
            return res.status(400).json({ message: "User already exists" });
        }
        //tao user moi
        const newUser = {
          username,
          password : hashed,
          roleId,
          entityId: null,
          entityType: "benh_nhan" //mặc định là bệnh nhân
        };

        //tra ve respond
        const createUser = await Usermodel.createUser(newUser);
        res.status(201).json({message: "User Created Successfully", userId: createUser});
        return  
    } catch (error) {
        res.status(500).json(err);
    }
  },

  //login
  loginUser: async (req, res) =>{
    try {
     const { username,password } = req.body;
     // lay user theo username
     const user = await Usermodel.getUserById(username);
     if(!user){
       return res.status(400).json({msg: "User not found"});
     }

      //So sánh password
      const isMatch = await bcrypt.compare(password, user.password_hash);
      if (!isMatch) {
        return res.status(400).json({ msg: "Invalid username or password" });
      // Trả về user info hoặc tạo JWT
      return res.status(200).json({ msg: "Login successful", userId: user.id, roleId: user.role_id });
      }
    } catch (error) {
      res.status(500).json(err);
    }
  },
  //logout
    LogoutUser: async (req, res) =>  {
    try{
      //xoa token hoac thuc hien cac thao tac logout
      req.logoutUser();
      res.status(200).json({msg:"logout successful"})
    }catch(error){
    }
  },
}



export default authController;