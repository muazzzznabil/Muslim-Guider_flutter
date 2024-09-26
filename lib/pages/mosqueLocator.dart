
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guider_v1/services/geolocator.dart';
import 'package:riverpod/riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// Import your provider
import '../dataProvider/data_provider.dart';
import '../dataProvider/mosque_v2_provider.dart';



class mosqueLocator extends ConsumerWidget {
  mosqueLocator({super.key});

  final _geolocator = geolocatorFinder();
  String city = 'loading...';
  void _getInititalInfo() async {
    Position position = await _geolocator.getCurrentPosition();
    Placemark placemark = await _geolocator.getAddressFromLatLng(position);
    city = placemark.locality.toString();
  }



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the list of mosque names
    final mosqueName = ref.watch(mosqueDataProviderV2);

    _getInititalInfo();
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            ref.refresh(mosqueDataProviderV2);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff50775e), Color(0xff142c28)],
              ),
            ),
            child: Column(
              children: [
                appBar(),
                SizedBox(height: 30),
                currentLocation(),
                Expanded(
                  child: mosqueName.when(
                    data: (mosqueName) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ListView.builder(
                          itemCount: mosqueName.length,
                          itemBuilder: (_, index) {
                            final mosque = mosqueName[index]; // Use a different variable name
                            return GestureDetector(
                              onTap: () async {
                                double lat = mosque.lat;
                                double lng = mosque.lng;
                                final Uri map = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
                                if (!await launchUrl(map)){
                                  throw Exception('Could not launch $map');
                                }
                              },
                              child: Card(
                                color: Colors.green,
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child:
                                ListTile(
                                  minTileHeight: 100,
                                  leading: SvgPicture.asset(
                                    'assets/icons/mosque-islam1.svg',
                                    width: 50,
                                  ),
                                  title: Text(
                                    mosque.name, // Use the new variable here
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${((mosque.distance ?? 0) / 1000).toStringAsFixed(2)} km away', // Display distance in kilometers
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    error: (err, s) => Text(err.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container currentLocation() {
    return Container(
      height: 90,
      width: 320,
      decoration: BoxDecoration(
        color: Color(0xffa6c0b3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Current Location',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xffffffff),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/redlocation.svg',
                width: 25,
                color: Colors.red,
              ),
              SizedBox(width: 3),
              Text(
                '$city',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xff302816),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Mosque Locator',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}

