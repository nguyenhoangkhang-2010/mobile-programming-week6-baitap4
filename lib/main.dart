import 'package:flutter/material.dart';
import 'package:app_week_6_bt4/screens/expense_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý chi tiêu',
      theme: ThemeData(),
      home: ExpenseScreen(),
    );
  }
}