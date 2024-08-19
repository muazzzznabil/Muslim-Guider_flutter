import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class geolocator{
  String? _currentAddress;
  Position? _currentPosition;


  //handle the access to the device location service
  @override
  Future<bool> handleLocationPermission(BuildContext? context) async{ //just add "context" in the parameter of the method.
  /*
  exp of the usage:
  geolocator.handleLocationPermission(context);
  */
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled(); //assign true or false value to the variable
    if(!serviceEnabled){
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar
        (content:Text('Location Services are disabled. Please enable the services') ));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(content: Text('Location permission are denied')));
          return false;
      }
    }
    if(permission == LocationPermission.deniedForever){
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text('Location permission are permanently denied. Please enabled it in device settings ')));
      return false;
    }
    return true;
  }

  Future<bool> getLocationPermission() async{ //return only boolean value for checking the permission
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return false;
    }
    permission = await Geolocator.checkPermission();
    if(permission ==  LocationPermission.denied || permission == LocationPermission.deniedForever){
      return false;
    }
    return true;
  }

  Future<Position> getCurrentPosition(BuildContext context) async { //return lng and long
    final hasPermission = await handleLocationPermission(context); //check if the permission is allowed
    Position position;
    if (hasPermission) {
      return  position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      }else{
      throw Exception('Location permission not granted');
    }
    }

  Future<Placemark> _getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    return place;
  }


}