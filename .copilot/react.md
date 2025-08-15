# React Front-end Guidelines (Sub-law)
- Luôn dùng tiếng Việt và tuân thủ **detailed-design**.
- Stack: React (ES6+), routing, Axios, state mgmt (Redux/Zustand).
- Không hard code credentials/secret/endpoint nhạy cảm vào code; dùng `.env` (client-side chỉ cho giá trị không nhạy cảm).

<Architecture>
- Thư mục gợi ý: `components/`, `pages/`, `routes/`, `services/` (API layer), `store/`, `hooks/`, `styles/`.
- Service layer (Axios) chịu trách nhiệm gọi REST API, interceptor xử lý token/401, retry hợp lý.
- UI states đầy đủ: loading / empty / error / success.
- Form: dùng form lib (react-hook-form) + validation (Yup/Zod).

<Practices>
- Routing rõ ràng, guard theo vai trò nếu cần.
- Performance: memoization hợp lý, code-splitting lazy routes.
- Accessibility: semantic HTML, aria-attributes.
- i18n nếu cần, responsive mặc định.

<Test & Lint>
```bash
npm run lint
npm test
```
- Viết test cho component quan trọng & service call.

<DoD (FE)>
- UI khớp thiết kế, responsive.
- Gọi API qua service, xử lý lỗi/timeout mạch lạc.
- Không commit biến môi trường nhạy cảm.
