import 'package:flutter/material.dart';

class AttendanceCalculator extends StatefulWidget {
  @override
  _AttendanceCalculatorState createState() => _AttendanceCalculatorState();
}

class _AttendanceCalculatorState extends State<AttendanceCalculator> {
  TextEditingController desiredPercentageController = TextEditingController();
  TextEditingController conductedClassesController = TextEditingController();
  TextEditingController attendedClassesController = TextEditingController();
  String result = '';

  void calculateAttendance() {
    final desiredPercentage = double.tryParse(desiredPercentageController.text);
    final conductedClasses = conductedClassesController.text.split(' ').map(int.parse).toList();
    final attendedClasses = attendedClassesController.text.split(' ').map(int.parse).toList();

    if (desiredPercentage == null || desiredPercentage < 0 || desiredPercentage > 100) {
      setState(() {
        result = 'Please enter a valid percentage between 0 and 100.';
      });
      return;
    }

    final totalConducted = conductedClasses.reduce((a, b) => a + b);
    final totalAttended = attendedClasses.reduce((a, b) => a + b);

    if (totalAttended > totalConducted) {
      setState(() {
        result = 'Attended classes cannot exceed conducted classes.';
      });
      return;
    }

    double presentPercentage = (totalAttended / totalConducted) * 100;
    int x = 0;

    while (presentPercentage < desiredPercentage) {
      x++;
      presentPercentage = ((totalAttended + x) / (totalConducted + x)) * 100;
    }

    setState(() {
      result = 'Your current percentage is ${presentPercentage.toStringAsFixed(2)}%. '
          'You need to attend $x more classes to reach $desiredPercentage%.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: desiredPercentageController,
              decoration: InputDecoration(labelText: 'Desired Attendance Percentage'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: conductedClassesController,
              decoration: InputDecoration(labelText: 'Number of Classes Conducted (separated by spaces)'),
            ),
            TextField(
              controller: attendedClassesController,
              decoration: InputDecoration(labelText: 'Number of Classes Attended (separated by spaces)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateAttendance,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
