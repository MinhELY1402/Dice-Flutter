import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dự Án Dice - Lắc Xúc Xắc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // Biến lưu trữ giá trị xúc xắc hiện tại (từ 1 đến 6)
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  int rollCount = 0;

  // Hàm xử lý logic ngẫu nhiên khi lắc xúc xắc sử dụng thư viện dart:math
  void rollDice() {
    setState(() {
      // Sinh số ngẫu nhiên trong khoảng từ 1 đến 6
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      rollCount++;
    });
  }

  // Hàm lắc riêng xúc xắc trái
  void rollLeftDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  // Hàm lắc riêng xúc xắc phải
  void rollRightDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalScore = leftDiceNumber + rightDiceNumber;

    return Scaffold(
      backgroundColor: const Color(0xFFE8ECEF),
      appBar: AppBar(
        title: const Text(
          'DICE - LẮC XÚC XẮC',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4A148C),
        elevation: 4,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Thẻ hiển thị thông tin kết quả
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'TỔNG ĐIỂM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '$totalScore',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A148C),
                          ),
                        ),
                        Text(
                          'Xúc xắc 1: $leftDiceNumber   |   Xúc xắc 2: $rightDiceNumber',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),

                // Khu vực hiển thị hình ảnh xúc xắc từ assets
                Row(
                  children: [
                    // Xúc xắc 1 (Bên trái)
                    Expanded(
                      child: GestureDetector(
                        onTap: rollLeftDice,
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/dice$leftDiceNumber.png',
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Xúc xắc 1: $leftDiceNumber',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Xúc xắc 2 (Bên phải)
                    Expanded(
                      child: GestureDetector(
                        onTap: rollRightDice,
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/dice$rightDiceNumber.png',
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Xúc xắc 2: $rightDiceNumber',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  '💡 Mẹo: Bạn có thể nhấn trực tiếp vào từng viên xúc xắc hoặc bấm nút bên dưới!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 36),

                // Nút bấm ElevatedButton để lắc cả 2 xúc xắc
                ElevatedButton.icon(
                  onPressed: rollDice,
                  icon: const Icon(
                    Icons.casino,
                    size: 28,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'LẮC XÚC XẮC',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A148C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 16,
                    ),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (rollCount > 0)
                  Text(
                    'Số lần đã lắc: $rollCount',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
