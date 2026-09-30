# Dự Án Dice - Ứng Dụng Lắc Xúc Xắc Flutter (Lab 3)

Ứng dụng Flutter cơ bản mô phỏng việc lắc xúc xắc ngẫu nhiên với giao diện trực quan, sử dụng tài nguyên hình ảnh từ `assets/` và các widget cơ bản trong Flutter.

---

## 🌟 Chức Năng Đã Thực Hiện

1. **Giao diện mô phỏng lắc xúc xắc**:
   - Hiển thị hình ảnh 2 viên xúc xắc sắc nét, bo góc và hiệu ứng bóng đổ đẹp mắt.
   - Hỗ trợ lắc cả 2 xúc xắc bằng nút bấm chính hoặc chạm trực tiếp vào từng viên xúc xắc.
   - Thẻ hiển thị **Tổng điểm** và số lần đã lắc.

2. **Quản lý tài nguyên `assets/`**:
   - Thư mục `assets/` chứa đầy đủ 6 hình ảnh: `dice1.png` đến `dice6.png`.
   - Đã khai báo đầy đủ trong [pubspec.yaml](file:///d:/%C4%91a%20n%E1%BB%81n%20t%E1%BA%A3ng/Lab%203/pubspec.yaml).

3. **Sử dụng các Widget Flutter cơ bản**:
   - `AppBar`: Thanh tiêu đề ứng dụng "DICE - LẮC XÚC XẮC".
   - `Column` & `Row`: Sắp xếp các thành phần theo chiều dọc và ngang.
   - `Expanded`: Giúp hình ảnh 2 xúc xắc cân đối và tự co giãn theo kích thước màn hình.
   - `Image.asset`: Hiển thị hình ảnh xúc xắc động từ `assets/dice$diceNumber.png`.
   - `ElevatedButton`: Nút bấm "LẮC XÚC XẮC" với biểu tượng `Icons.casino`.
   - `setState()`: Cập nhật lại giao diện (UI) mỗi khi trạng thái số xúc xắc thay đổi.

4. **Xử lý logic ngẫu nhiên**:
   - Sử dụng thư viện `dart:math` với `Random().nextInt(6) + 1` để sinh số ngẫu nhiên từ 1 đến 6.

---

## 📁 Cấu Trúc Dự Án

```
Lab 3/
├── assets/
│   ├── dice1.png
│   ├── dice2.png
│   ├── dice3.png
│   ├── dice4.png
│   ├── dice5.png
│   └── dice6.png
├── lib/
│   └── main.dart          # Toàn bộ mã nguồn giao diện và logic lắc xúc xắc
├── test/
│   └── widget_test.dart   # File kiểm thử giao diện
├── pubspec.yaml           # Khai báo thư viện và tài nguyên assets
└── README.md              # Tài liệu hướng dẫn
```

---

## 🚀 Hướng Dẫn Chạy Ứng Dụng

1. Mở thư mục dự án trong VS Code hoặc Android Studio.
2. Mở Terminal và tải các gói phụ thuộc:
   ```bash
   flutter pub get
   ```
3. Khởi động máy ảo (Emulator/Simulator) hoặc thiết bị thật, sau đó chạy:
   ```bash
   flutter run
   ```
