import 'package:Login_ui/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import './attendance_list.dart';
import 'main.dart';
import 'user_location.dart';

class AttendanceForm extends StatefulWidget {
  const AttendanceForm({Key? key}) : super(key: key);

  @override
  _AttendanceFormState createState() => _AttendanceFormState();
}

class _AttendanceFormState extends State<AttendanceForm> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initalization();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Punch in and punch out';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 91, 44),
          centerTitle: true,
          title: Text('New punch'),
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
        body: googleMapUI());

    // Container(
    //   child: Column(
    //     children: [
    //       Expanded(
    //           child: Container(
    //         padding: EdgeInsets.fromLTRB(5, 5, 5, 300),
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: Colors.black,
    //             width: 1,
    //           ),
    //         ),
    //         child: GoogleMap(
    //           mapType: MapType.normal,
    //           initialCameraPosition:
    //               CameraPosition(target: LatLng(28.7041, 77.1025), zoom: 18),
    //           onMapCreated: (GoogleMapController controller) {},
    //         ),
    //       ))
    //     ],
    //   ),
    // ),
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(builder: (consumerContext, model, child) {
      if (model.locationPosition != null) {
        return Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 300),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962)),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) {},
              ),
            ))
          ],
        );
      }
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}


























//MaterialApp(
    //  home: UserLiveLocation(),

    // Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Color.fromARGB(255, 229, 91, 44),
    //     centerTitle: true,
    //     title: Text('Add punch'),
    //     leading: IconButton(
    //       onPressed: () {
    //         Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(builder: (context) => HomePage()),
    //           (Route<dynamic> route) => false,
    //         );
    //       },
    //       // ignore: prefer_const_constructors
    //       icon: Icon(Icons.home),
    //     ),
    //     actions: [
    //       IconButton(
    //         onPressed: () {},
    //         // ignore: prefer_const_constructors
    //         icon: Icon(Icons.logout),
    //       ),
    //     ],
    //   ),
    //   body: Container(
    //     margin: EdgeInsets.all(15),
    //     padding: EdgeInsets.all(10),
    //     child: Form(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             TextFormField(
    //               keyboardType: TextInputType.datetime,
    //               decoration: InputDecoration(
    //                   hintText: 'Date Time',
    //                   labelText: 'Date Time',
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(1.0))),
    //             ),
    //             Container(
    //               margin: EdgeInsets.fromLTRB(100, 200, 100, 100),
    //               padding: EdgeInsets.all(20.0),
    //               child: Row(
    //                 children: [
    //                   ElevatedButton(onPressed: () {}, child: Text('Submit'))
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
    // );