// controllers/searchController.js
import pool from "../db.js";

/**
 * GET /search?kw=&hospital=&dept=&price=&rating=&page=&limit=
 */
export async function searchDoctors(req, res) {
  try {
    const {
      kw = "",
      hospital,
      dept,
      price,
      rating,
      page = 1,
      limit = 50,
    } = req.query;

    const pageNum = Math.max(Number(page) || 1, 1);
    const pageLimit = Math.min(Math.max(Number(limit) || 50, 1), 200);
    const offset = (pageNum - 1) * pageLimit;

    // 1) Kiểm tra xem cột phi_kham có tồn tại không
    const [colRows] = await pool.query(
      `SELECT COLUMN_NAME
       FROM INFORMATION_SCHEMA.COLUMNS
       WHERE TABLE_SCHEMA = DATABASE()
         AND TABLE_NAME = 'bac_sis'
         AND COLUMN_NAME = 'phi_kham'`
    );
    const hasPrice = colRows.length > 0;

    // 2) Build WHERE clauses động
    const whereClauses = [];
    const params = [];

    if (kw) {
      whereClauses.push(`(bs.ho_ten LIKE ? OR cn.ten_chuyen_nganh LIKE ?)`);
      params.push(`%${kw}%`, `%${kw}%`);
    }

    if (hospital) {
      if (/^\d+$/.test(hospital)) {
        whereClauses.push(`bv.id = ?`);
        params.push(hospital);
      } else {
        whereClauses.push(`bv.ten_benh_vien LIKE ?`);
        params.push(`%${hospital}%`);
      }
    }

    if (dept) {
      if (/^\d+$/.test(dept)) {
        whereClauses.push(`cn.id = ?`);
        params.push(dept);
      } else {
        whereClauses.push(`cn.ten_chuyen_nganh LIKE ?`);
        params.push(`%${dept}%`);
      }
    }

    // price: dạng "min-max" hoặc "min-" hoặc "-max"
    if (price && hasPrice) {
      const parts = String(price).split("-");
      const min = parts[0] === "" ? null : parseFloat(parts[0]);
      const max = parts[1] === "" ? null : parseFloat(parts[1]);
      if (!isNaN(min) && min !== null) {
        whereClauses.push(`bs.phi_kham >= ?`);
        params.push(min);
      }
      if (!isNaN(max) && max !== null) {
        whereClauses.push(`bs.phi_kham <= ?`);
        params.push(max);
      }
    }

    // 3) Build SQL
    const selectCols = [
      "bs.id",
      "bs.ho_ten AS name",
      "bs.email",
      "bs.so_dien_thoai AS phone",
      "bs.chuc_danh",
      "bs.so_nam_kinh_nghiem",
      "bv.id AS hospital_id",
      "bv.ten_benh_vien AS hospital_name",
      "COALESCE(AVG(ct.so_sao_danh_gia), 0) AS avg_rating",
      "GROUP_CONCAT(DISTINCT cn.ten_chuyen_nganh) AS specialties",
    ];
    if (hasPrice) selectCols.push("bs.phi_kham");

    let sql = `
      SELECT ${selectCols.join(", ")}
      FROM bac_sis bs
      LEFT JOIN benh_viens bv ON bs.id_benh_vien = bv.id
      LEFT JOIN bacsi_chuyennganh bscn ON bscn.id_bac_si = bs.id
      LEFT JOIN chuyen_nganhs cn ON bscn.id_chuyen_nganh = cn.id
      LEFT JOIN chi_tiet_dat_lichs ct ON ct.id_bac_si = bs.id
    `;

    if (whereClauses.length > 0) {
      sql += " WHERE " + whereClauses.join(" AND ");
    }

    sql += " GROUP BY bs.id";

    // rating filter (HAVING)
    if (rating) {
      const ratingNum = parseFloat(rating) || 0;
      sql += " HAVING avg_rating >= ?";
      params.push(ratingNum);
    }

    sql += " ORDER BY avg_rating DESC, bs.ho_ten ASC";
    sql += " LIMIT ? OFFSET ?";

    // params cuối là limit và offset
    params.push(pageLimit, offset);

    // 4) Query
    const [rows] = await pool.query(sql, params);

    // 5) Map result
    const data = rows.map((r) => ({
      id: r.id,
      name: r.name,
      email: r.email,
      phone: r.phone,
      chuc_danh: r.chuc_danh,
      years_experience: r.so_nam_kinh_nghiem,
      hospital: { id: r.hospital_id, name: r.hospital_name },
      avg_rating: Number(r.avg_rating) || 0,
      specialties: r.specialties ? r.specialties.split(",") : [],
      ...(hasPrice ? { price: r.phi_kham !== null ? Number(r.phi_kham) : null } : {}),
    }));

    const meta = {
      page: pageNum,
      limit: pageLimit,
      returned: data.length,
      price_filter_applied: Boolean(price && hasPrice),
      note: hasPrice ? undefined : (price ? "price filter ignored: 'phi_kham' column not found" : undefined),
    };

    return res.json({ meta, data });
  } catch (err) {
    console.error("searchDoctors error:", err);
    return res.status(500).json({ msg: "Server error", error: err.message });
  }
}
