import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class LocationProvider with ChangeNotifier {
  late Location _location;
  Location get location => _location;
  late LatLng _locationPosition;
  LatLng get locationPosition => _locationPosition;
  bool locationServiceActive = true;

  LocationProvider() {
    _location = new Location();
  }
  initalization() async {
    await getUserLocation();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permisionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      return;
    }

    _permisionGranted = await location.hasPermission();
    if (_permisionGranted == PermissionStatus.denied) {
      _permisionGranted = await location.requestPermission();
      if (_permisionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationPosition = LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      );
      print(_locationPosition);
      notifyListeners();
    });
  }
}
