//get location by IP address
import 'dart:io';

import 'package:network_info_plus/network_info_plus.dart';

class ip_location{

  String _wifiIpAddress = '';
  String _mobileIpAddress = '';

   static Future<void> getIpAddresses() async{
    final info = NetworkInfo();

    //get ip address from wifi
    String? wifiIpAddress = await info.getWifiIP();
    print('Wifi IP address = $wifiIpAddress');
    if(wifiIpAddress == null){
      wifiIpAddress = 'Not connected to WIFI';
    }

    //get ip address from mobile data
    String? mobileIpAddress;
    for(var interface in await NetworkInterface.list()){
      for (var address in interface.addresses){
        if(address.type == InternetAddressType.IPv4){
          mobileIpAddress = address.address;
          print('Mobile IP Address:  $mobileIpAddress');
        }
      }
    }

  }

}