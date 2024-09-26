import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guider_v1/services/geolocator.dart';
import 'package:riverpod/riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../dataProvider/data_provider.dart';
import '../dataProvider/mosque_v2_provider.dart';

class mosqueLocator extends ConsumerWidget {
  mosqueLocator({super.key});

  final _geolocator = geolocatorFinder();
  String city = 'loading...';

  void _getInitialInfo() async {
    Position position = await _geolocator.getCurrentPosition();
    Placemark placemark = await _geolocator.getAddressFromLatLng(position);
    city = placemark.locality.toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mosqueName = ref.watch(mosqueDataProviderV2);
    _getInitialInfo();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(mosqueDataProviderV2);
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff4caf50), Color(0xff2e7d32)], // Green gradient
            ),
          ),
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(height: 30),
              _buildCurrentLocation(ref),
              Expanded(
                child: mosqueName.when(
                  data: (mosqueName) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: mosqueName.length,
                        itemBuilder: (_, index) {
                          final mosque = mosqueName[index];
                          return GestureDetector(
                            onTap: () async {
                              double lat = mosque.lat;
                              double lng = mosque.lng;
                              final Uri map = Uri.parse(
                                  'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
                              if (!await launchUrl(map)) {
                                throw Exception('Could not launch $map');
                              }
                            },
                            child: Card(
                              color: const Color(0xff81c784), // Light green
                              elevation: 8, // Higher elevation for more depth
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                leading: SvgPicture.asset(
                                  'assets/icons/mosque-islam1.svg',
                                  width: 50,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  mosque.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
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
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Mosque Locator',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          letterSpacing: 1.2,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _buildCurrentLocation(WidgetRef ref) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff81c784), Color(0xff4caf50)], // Green gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Current Location',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated location icon
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent.withOpacity(0.8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/redlocation.svg',
                    width: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  city,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
            ref.refresh(mosqueDataProviderV2);
            },
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
            label: const Text(
              "Update Location",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.green.shade700,
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }

}
