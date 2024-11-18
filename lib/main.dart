import 'package:flutter/material.dart';
import 'home.dart';
import 'attendance_calculator.dart';
import 'ltps_attendance_calculator.dart';

void main() {
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: {
        '/ltps': (context) => AttendanceCalculator(),
        '/classes': (context) => LTPSAttendanceCalculator(),
      },
    );
  }
}
