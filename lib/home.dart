import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Calculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ltps');
              },
              child: Text('Classes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/classes');
              },
              child: Text('LTPS'),
            ),
          ],
        ),
      ),
    );
  }
}
