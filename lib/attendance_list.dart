import 'package:flutter/material.dart';
import './attendance_form.dart';
import './login.dart';
import './main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//this is the main page after login
// list view to view all the attendances
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const title = 'Your attendances';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 91, 44),
          centerTitle: true,
          title: Text('My attendances'),
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
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                  (Route<dynamic> route) => false,
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: ListView(
            children: [
              Card(
                  child: ListTile(
                title: Text("Checked in at :" + " 2022-02-27 08:00:33"),
              )),
              Card(
                child: ListTile(
                  title: Text("Checkedout at :" + " 2022-02-27 18:00:33"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 200, 50, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 229, 91, 44),
                    ),
                  ),

                  child: Padding(
                      padding: EdgeInsets.all(20.0), child: Text('Add punch')),

                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AttendanceForm()),
                      //MaterialPageRoute(builder: (context) => AttendanceForm()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  // child: const Text('Add punch'),
                ),
              ),
            ],
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
