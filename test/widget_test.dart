import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dice_app/main.dart';

void main() {
  group('Kiểm thử Dự án Dice App', () {
    testWidgets('1. Kiểm tra giao diện ban đầu hiển thị đầy đủ widget', (WidgetTester tester) async {
      await tester.pumpWidget(const DiceApp());

      // Kiểm tra AppBar
      expect(find.text('DICE - LẮC XÚC XẮC'), findsOneWidget);

      // Kiểm tra Thẻ Tổng Điểm
      expect(find.text('TỔNG ĐIỂM'), findsOneWidget);

      // Kiểm tra Nút bấm Lắc Xúc Xắc
      expect(find.text('LẮC XÚC XẮC'), findsOneWidget);
      expect(find.byIcon(Icons.casino), findsOneWidget);

      // Kiểm tra 2 hình ảnh xúc xắc từ assets
      expect(find.byType(Image), findsNWidgets(2));
    });

    testWidgets('2. Kiểm tra sự kiện bấm nút LẮC XÚC XẮC cập nhật giao diện', (WidgetTester tester) async {
      await tester.pumpWidget(const DiceApp());

      // Ban đầu chưa hiển thị 'Số lần đã lắc'
      expect(find.textContaining('Số lần đã lắc:'), findsNothing);

      // Tìm nút Lắc Xúc Xắc và cuộn vào tầm nhìn nếu cần
      final buttonFinder = find.widgetWithText(ElevatedButton, 'LẮC XÚC XẮC');
      await tester.ensureVisible(buttonFinder);
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      // Sau khi bấm, số lần đã lắc là 1
      expect(find.text('Số lần đã lắc: 1'), findsOneWidget);

      // Bấm thêm lần nữa
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
      expect(find.text('Số lần đã lắc: 2'), findsOneWidget);
    });

    testWidgets('3. Kiểm tra chạm vào từng viên xúc xắc', (WidgetTester tester) async {
      await tester.pumpWidget(const DiceApp());

      // Chạm vào xúc xắc đầu tiên
      final firstDice = find.byType(GestureDetector).first;
      await tester.ensureVisible(firstDice);
      await tester.tap(firstDice);
      await tester.pumpAndSettle();

      // UI vẫn render ổn định và hợp lệ
      expect(find.byType(Image), findsNWidgets(2));
    });
  });
}
