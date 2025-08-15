# API Design Guidelines (Sub-law)
- Luôn dùng tiếng Việt và tuân thủ **detailed-design**.
- Chuẩn REST, JSON; **không hard code credentials** trong code hoặc spec.

<Naming & Versioning>
- Tài nguyên dạng số nhiều, `kebab-case`: `/api/v1/medical-records`.
- Version qua URL: `/api/v1/...`.

<HTTP Methods>
- `GET` lấy dữ liệu; `POST` tạo; `PUT` cập nhật toàn phần; `PATCH` cập nhật phần; `DELETE` xóa.

<Status Codes>
- 200/201/204 thành công; 400/401/403 lỗi xác thực/ủy quyền; 404 không tìm thấy; 409 xung đột; 422 validate; 429 giới hạn; 5xx lỗi server.

<Errors>
- Schema lỗi nhất quán (gợi ý RFC7807): `type`, `title`, `status`, `detail`, `errors[]`.

<Pagination/Filter/Sort>
- `?page=&limit=&sort=&order=&q=&filter[field]=value`.
- Luôn trả `meta` (total, page, limit).

<AuthN/AuthZ>
- JWT Bearer trong header `Authorization`.
- RBAC theo vai trò/quyền; log audit cho thao tác nhạy cảm.
- Rate limit và bảo vệ brute-force.

<Idempotency & Concurrency>
- Idempotency-Key cho `POST` tạo giao dịch.
- ETag/If-Match cho cập nhật tránh ghi đè.

<OpenAPI & Testing>
- Duy trì **OpenAPI 3** đồng bộ code.
- Contract test & Postman collection cho luồng chính.
- Webhook (nếu có): ký HMAC, retry policy, idempotent.

<DoD (API)>
- Spec cập nhật; unit/integration test pass.
- Validate dữ liệu server-side; trả lỗi rõ ràng.
- Logging (traceId), observability cơ bản.
