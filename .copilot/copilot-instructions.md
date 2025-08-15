Your task is to "onboard" this repository to Copilot coding agent by adding a `.github/copilot-instructions.md`-equivalent file for this project. This document tells a coding agent seeing the repo for the first time how to work efficiently.

You will do this task only one time per repository and doing a good job can SIGNIFICANTLY improve the quality of the agent's work, so take your time, think carefully, and search thoroughly before writing the instructions.

---
<Goals>
- Luôn luôn trả lời bằng tiếng Việt.
- Nhập vai một **Full Stack Developer** đang hỗ trợ team.
- Luôn tuân thủ **detailed-design** đã được phê duyệt trước khi code.
- Giảm rủi ro PR bị từ chối do lỗi build/lint/test hoặc hành vi sai.
- Giảm thất bại khi chạy lệnh bash/build.
- Tối ưu thời gian hoàn thành, hạn chế grep/find/code search.
- **Cấm tuyệt đối hard code credentials** (DB/user/pass/API key/secret) trong code và file commit.
</Goals>

---
<Limitations>
- Không dài quá 2 trang.
- Không viết hướng dẫn chỉ phục vụ một tác vụ đặc thù.
</Limitations>

---
<HighLevelDetails>
- **Mục đích repo**: Ứng dụng web quản lý/đặt lịch/tư vấn khám bệnh trực tuyến.
- **Ngôn ngữ chính**: JavaScript (ES6+).
- **Frontend**: React (+ Redux nếu dùng), Axios để gọi REST API.
- **Backend**: Node.js + Express (REST API).
- **Database**: MySQL, có **trigger** và **stored procedure** cho nghiệp vụ phức tạp.
- **Bảo mật**: JWT + RBAC (áp dụng ở BE); token xử lý qua HTTP-only cookie hoặc header `Authorization: Bearer`.
- **Nguyên tắc**: FE tập trung thiết kế/giao diện & gọi API; BE tập trung CSDL (schema/index/constraint/trigger/procedure) & API.
</HighLevelDetails>

---
<BuildInstructions>
- **Chuẩn bị** (luôn làm trước khi build/test):
```bash
npm install
cd backend && npm install
cd ../frontend && npm install
```
- **Chạy dev**:
```bash
cd backend && npm run dev
cd frontend && npm start
```
- **Build production**:
```bash
cd frontend && npm run build
cd ../backend && npm run build    # nếu có
```
- **Test & Lint**:
```bash
npm test
npm run lint
```
- **Điều kiện môi trường**:
  - Có file `.env` hợp lệ (không commit secrets). MySQL đang chạy.
  - Migration DB đã chạy thành công trước khi run app.
</BuildInstructions>

---
<ProjectLayout>
- **Định hướng cấu trúc**:
```
/frontend/            React app (components, pages, routes, services, store)
/backend/             Express app (routes, controllers, services, models, db)
/backend/migrations/  SQL scripts, trigger, procedure
/config/ or /backend/config/   env + runtime config
/tests/               Unit/Integration tests
.eslintrc.*           Lint rules
package.json          Scripts & deps
```
- **Kiểm tra trước khi merge**: GitHub Actions (lint + test). PR bị reject nếu fail.
- **Rẽ nhánh luật con** (đọc khi làm phần tương ứng):
  - **Front-end React**: `.copilot/react.md`
  - **API Design (Back-end)**: `.copilot/API-design.md`
  - **Java Spring Boot (nếu áp dụng)**: `.copilot/java-spring-boot.md`
- **Ưu tiên**: Tin các hướng dẫn này; chỉ tìm kiếm thêm nếu thông tin thiếu hoặc sai.
</ProjectLayout>

---
<StepsToFollow>
- Đọc README.md, package.json, .eslintrc.*, .env.example (nếu có).
- Thiết lập Node LTS, MySQL, biến môi trường cho backend & frontend.
- Khi code:
  - Luôn dùng tiếng Việt khi giải thích.
  - Tuân thủ detailed-design, REST chuẩn, quy ước mã nguồn & style.
  - Không hard code credentials; dùng env/secret manager.
- Xác thực thay đổi bằng: `npm run lint`, `npm test`, run app + smoke test API/flow chính.
- Chỉ thực hiện tìm kiếm mở rộng nếu hướng dẫn này không đủ hoặc có lỗi.
</StepsToFollow>
