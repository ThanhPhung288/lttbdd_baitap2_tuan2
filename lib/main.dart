import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


String xepLoai(double diem) {
  if (diem < 0 || diem > 10) {
    return 'Không hợp lệ';
  } else if (diem >= 8.0) {
    return 'Giỏi';
  } else if (diem >= 6.5) {
    return 'Khá';
  } else if (diem >= 5.0) {
    return 'Trung bình';
  } else {
    return 'Yếu';
  }
}


Color mauChu(String loai) {
  if (loai == 'Giỏi') {
    return Colors.green;
  } else if (loai == 'Khá') {
    return Colors.blue;
  } else if (loai == 'Trung bình') {
    return Colors.orange;
  } else if (loai == 'Yếu') {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}


Widget dongKiemTra(double diem) {
  String loai = xepLoai(diem);
  return Container(
    padding: const EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Điểm $diem'),
        Text(
          loai,
          style: TextStyle(color: mauChu(loai), fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    double diem = 8.5;
    String loai = xepLoai(diem);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Xếp loại học lực'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: [
                    const Text('Điểm trung bình'),
                    Text(
                      '$diem',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loai,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: mauChu(loai),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),


              const Text('KIỂM TRA THÊM'),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    dongKiemTra(9),
                    dongKiemTra(7),
                    dongKiemTra(5.5),
                    dongKiemTra(3),
                    dongKiemTra(11),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}