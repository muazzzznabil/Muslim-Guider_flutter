import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class geolocator{
  String? _currentAddress;
  Position? _currentPosition;

/*************************************************************************************
* What this Class do:
 * -handle location permission > return Snackbar to warn the user
 * -getLocationPermission      > return boolean value to check the location Permission
 * -getCurrentLocation         > return current Location (lng, lng)  of the user in List form
 * -getAddressFromLatLng       > return human-readable address exp:
 *                                  -> country
 *                                  -> locality > city name
 *                                  -> postalCode > postCode
 *                                  -> street > Street Name
* ************************************************************************************/


  //handle the access to the device location service
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
    final prefs = await SharedPreferences.getInstance();

    if (hasPermission) {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      await prefs.setDouble('lastLat', position.latitude);
      await prefs.setDouble('lastLong', position.longitude);
      return position;
          return  position;
      }else{
      throw Exception('Location permission not granted');
    }
    }

  Future<Placemark> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    return place;
  }

  Future<Position> getLastKnownLatlng() async {
    Position? position = await Geolocator.getLastKnownPosition();
    final prefs = await SharedPreferences.getInstance();

    if (position != null) {
      await prefs.setDouble('lastLat', position.latitude);
      await prefs.setDouble('lastLong', position.longitude);
      return position;
    } else {
      throw Exception("No last known location available");
    }
  }

  Future<Placemark> getLastKnownPlace() async{
    Position position = await getLastKnownLatlng();
    final prefs = await SharedPreferences.getInstance();

    final lat = await prefs.getDouble('lastLat');
    final lng = await prefs.getDouble('lastLong');

    if (lat == null || lng == null) {
      throw Exception("No saved location available");
    }
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        return placemarks[0];
      } else {
        throw Exception("No placemark found for the given coordinates");
      }
    } catch (e) {
      throw Exception("Error retrieving placemark: $e");
    }
  }


}