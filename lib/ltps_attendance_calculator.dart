import 'package:flutter/material.dart';

class LTPSAttendanceCalculator extends StatefulWidget {
  @override
  _LTPSAttendanceCalculatorState createState() => _LTPSAttendanceCalculatorState();
}

class _LTPSAttendanceCalculatorState extends State<LTPSAttendanceCalculator> {
  TextEditingController lectureController = TextEditingController();
  TextEditingController tutorialController = TextEditingController();
  TextEditingController practicalController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  String result = '';

  void calculateAttendance() {
    double totalScore = 0;
    double totalWeight = 0;

    final inputs = {
      'lecture': lectureController.text,
      'tutorial': tutorialController.text,
      'practical': practicalController.text,
      'skill': skillController.text,
    };

    final weights = {
      'lecture': 100.0,
      'tutorial': 100.0,
      'practical': 50.0,
      'skill': 25.0,
    };

    for (var key in inputs.keys) {
      final value = double.tryParse(inputs[key] ?? ''); // Ensure non-nullable
      if (value != null && value >= 0 && value <= 100) {
        totalScore += value * (weights[key]! / 100); // Null safety for weights
        totalWeight += weights[key]!;
      }
    }

    if (totalWeight > 0) {
      final attendancePercentage = (totalScore / totalWeight) * 100;
      setState(() {
        result = 'Your LTPS attendance is ${attendancePercentage.toStringAsFixed(2)}%';
      });
    } else {
      setState(() {
        result = 'Please enter valid percentages for at least one field.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LTPS Attendance Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: lectureController,
              decoration: InputDecoration(labelText: 'Lecture Percentage'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tutorialController,
              decoration: InputDecoration(labelText: 'Tutorial Percentage'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: practicalController,
              decoration: InputDecoration(labelText: 'Practical Percentage'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: skillController,
              decoration: InputDecoration(labelText: 'Skill Percentage'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateAttendance,
              child: Text('Calculate Attendance'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
