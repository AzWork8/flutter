import 'package:flutter/material.dart';
import './attendance_list.dart';

class AttendanceForm extends StatefulWidget {
  const AttendanceForm({Key? key}) : super(key: key);

  @override
  _AttendanceFormState createState() => _AttendanceFormState();
}

class _AttendanceFormState extends State<AttendanceForm> {
  @override
  Widget build(BuildContext context) {
    const title = 'Punch in and punch out';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 91, 44),
          centerTitle: true,
          title: Text('Add punch'),
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(Icons.home),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
