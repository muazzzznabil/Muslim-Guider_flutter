

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guider_v1/services/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class locationTest extends StatefulWidget {
  const locationTest({super.key});

  @override
  State<locationTest> createState() => _locationTestState();
}


class _locationTestState extends State<locationTest> {
  String permissionStatus = 'Checking....';
  String permStat = 'Checking....';
  String latStat = 'Waiting....';
  String lngStat = 'Waiting....';
  String country = 'Unknown....';
  String locality = 'Unknown....';
  String postalCode = 'Unknown....';
  String street = 'Unknown....';

  // @override
  // void initState(){
  //   super.initState();
  //   _getInititalInfo();
  // }

  void _getInititalInfo() async{
    geolocator().handleLocationPermission(context);
    bool perm = await geolocator().getLocationPermission();
    Position position= await geolocator().getCurrentPosition(context);
    Placemark placemark = await geolocator().getAddressFromLatLng(position);

    latStat = position.latitude.toString();
    lngStat = position.longitude.toString();

    country = placemark.country.toString();
    locality = placemark.locality.toString();
    postalCode = placemark.postalCode.toString();
    street = placemark.street.toString();


    setState(() {
      if(perm){
        permissionStatus = 'Access Allowed';
        print('Access Allowed (Set State)');
      }else{
        permissionStatus = 'Access Deni ed';
        print('Access Denied (Set State)');

      }
    });
    if(perm){
      permStat = 'Access Allowed';
      print('Access Allowed');
    }else{
      permStat = 'Access Denied';
      print('Access Denied');

    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Location Test'),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 8,width: 300,child: Divider(),),
            Text('Handle Location' ),
            SizedBox(height: 8,width: 300,child: Divider(),),
            Text('get Location Permission : $permStat'),
            Text('Permission Using Set State: $permissionStatus'),
            SizedBox(height: 8,width: 300,child: Divider(),),
            Text('get Current Location'),
            Text('lat : $latStat'),
            Text('lng : $lngStat'),
            SizedBox(height: 8,width: 300,child: Divider(),),
            Text('get Address from lat,lng'),
            Text('Country : $country'),
            Text('locality (City Name) : $locality'),
            Text('postalCode (PostCode) : $postalCode'),
            Text('street : $street'),
            SizedBox(height: 8,width: 300,child: Divider(),),


            GestureDetector(
              onTap: (){
                _getInititalInfo();
              },
              child: Container(

                  child: Text('Get Location',textAlign: TextAlign.center,),
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)
                ),
                ),
            )

          ],
        ),
      ),
    );
  }
}
