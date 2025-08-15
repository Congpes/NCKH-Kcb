# Java Spring Boot Guidelines (Sub-law)
> Áp dụng nếu repo hoặc module có sử dụng Spring Boot. Nếu không, bỏ qua.
- Luôn trả lời bằng tiếng Việt và tuân thủ **detailed-design**.
- **Cấm hard code credentials**. Dùng biến môi trường / secret manager / config ngoài repo.

<Architecture>
- Phân lớp rõ ràng: Controller, Service, Repository, Entity, Config, Security, Utils.
- Controller không chứa nghiệp vụ; Service chứa logic; Repository truy cập DB (JPA/JDBC).

<Security>
- Dùng **Spring Security** cho xác thực & phân quyền.
- JWT hoặc OAuth2; mật khẩu hash (BCrypt).
- Cấu hình CORS, CSRF phù hợp (API REST thường tắt CSRF có kiểm soát).
- Áp RBAC qua `@PreAuthorize`/`@Secured`.

<Credentials>
- Không hard code: DB URL/user/pass, API keys, secrets.
- Sử dụng `application.yml` + biến môi trường; không commit thông tin nhạy cảm.
- Hỗ trợ `@ConfigurationProperties` để bind cấu hình.

<Build & Run>
```bash
./mvnw clean install
./mvnw spring-boot:run
./mvnw test
```
- Đóng gói: `./mvnw clean package && java -jar target/app.jar`.

<Checklist>
1) Không có credentials trong code hoặc file theo dõi git.
2) Spring Security bật & test qua endpoints.
3) Kiến trúc phân lớp tuân thủ.
4) Migration DB (Flyway/Liquibase) cập nhật.
