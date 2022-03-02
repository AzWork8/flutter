import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './attendance_list.dart';
import './main.dart';

class UserLiveLocation extends StatefulWidget {
  const UserLiveLocation({Key? key}) : super(key: key);

  @override
  _UserLiveLocationState createState() => _UserLiveLocationState();
}

class _UserLiveLocationState extends State<UserLiveLocation> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Expanded(
              child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: LatLng(28.7041, 77.1025), zoom: 18),
            onMapCreated: (GoogleMapController controller) {},
          ))
        ],
      ),
    );
  }
}
