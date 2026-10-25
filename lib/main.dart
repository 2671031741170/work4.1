import 'package:flutter/material.dart';
import 'screen/addform.dart';

void main() {
  runApp(const MyApp()); // ✅ เรียก MyApp แทน AddForm
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddForm(), // ✅ เรียก AddForm เป็นหน้าหลัก
    );
  }
}