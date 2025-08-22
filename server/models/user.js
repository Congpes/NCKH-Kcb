import pool from "../db.js"

// Lấy user theo username
export async function getUserByUsername(username) {
  const [rows] = await pool.query(
    "SELECT * FROM users WHERE username = ?",
    [username]
  );
  return rows[0];
}

// Tạo user mới
export async function createUser({ username, passwordHash, roleId, entityId, entityType }) {
  const [result] = await pool.query(
    `INSERT INTO users (username, password_hash, role_id, entity_id, entity_type)
     VALUES (?, ?, ?, ?, ?)`,
    [username, passwordHash, roleId, entityId, entityType]
  );
  return result.insertId;
}

// Lấy user theo id
export async function getUserById(id) {
  const [rows] = await pool.query("SELECT * FROM users WHERE id = ?", [id]);
  return rows[0];
}

// Cập nhật trạng thái
export async function updateUserStatus(id, tinh_trang) {
  const [result] = await pool.query(
    "UPDATE users SET tinh_trang = ? WHERE id = ?",
    [tinh_trang, id]
  );
  return result.affectedRows;
}
