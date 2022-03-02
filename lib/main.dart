// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutable
import 'package:Login_ui/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
import './attendance_form.dart';
import './attendance_list.dart';
import './login.dart';

// import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LocationProvider(),
            child: AttendanceForm(),
          )
        ],
        child: MaterialApp(
          title: 'Moonline Attendance System',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'SanFrancisco',
          ),
          home: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
            body: LoginScreen(),
            bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Moonline Travel",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ));
  }
}





//this is the main page after login
// list view to view all the attendances