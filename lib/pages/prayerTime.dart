import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guider_v1/model/cityList.dart';
import 'package:muslim_guider_v1/model/waktuSolat_model.dart';
import 'package:muslim_guider_v1/services/pray_time_service.dart';

import '../dataProvider/waktu_solat_provider.dart';
import '../services/geolocator.dart';

class prayerTime extends ConsumerWidget {
  prayerTime({super.key});

  Color white = Colors.white;
  Shadow basicShadow = Shadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 10,
      offset: Offset(4, 4));
  String city = 'loading...';

  final _geolocator = geolocatorFinder();

  void _getInititalInfo() async {
    Position position = await _geolocator.getCurrentPosition();
    Placemark placemark = await _geolocator.getAddressFromLatLng(position);
    city = placemark.locality.toString();
  }

  @override
  Widget build(BuildContext context, ref) {
    _getInititalInfo();
    final _waktuSolat = ref.watch(waktuSolatProvider);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff67987c),
        appBar: appBar(context),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.refresh(waktuSolatProvider);
          },
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background/prayTimeBg.png'),
                      opacity: 0.9,
                      fit: BoxFit.cover)),
              child: ListView(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            //Search Bar
                            width: MediaQuery.of(context).size.width * 0.9,
                            // child: buildSearchBar(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          topSection(context, _waktuSolat), //topSection
                          SizedBox(
                            height: 20,
                          ),
                          bottomContainer(context, _waktuSolat),
                        ],
                      )
                    ],
                  ),
                ],
              )),
        ));
  }

  Container bottomContainer(
      BuildContext context, AsyncValue<PrayerTime> _waktuSolat) {
    return Container(
      //bottom section
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(2, 4),
                blurRadius: 2),
          ],
          color: Color(0xffA6C0B3).withOpacity(0.6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                //for location
                children: [
                  SvgPicture.asset(
                    'assets/icons/map-pin-white.svg',
                    width: 20,
                  ),
                  Text(
                    '$city',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w200,
                        fontSize: 13),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Divider(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //Subh
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/subh-icon.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Subh',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                            Text(
                              _waktuSolat.when(
                                  data: (waktuSolat) {
                                    String subh = waktuSolat.subh;
                                    // final subhTime = waktuSolat. ? subh : 'N/A';
                                    return subh;
                                  },
                                  error: (err, s) => ' $err',
                                  loading: () => '..'),
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Divider(
                        color: white,
                      ),
                    ),
                    Container(
                      //Syuruk
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/syuruk-icon.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Syuruk',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                            Text(
                              _waktuSolat.when(
                                  data: (_waktuSolat) {
                                    String syuruk = _waktuSolat.syuruk;
                                    // final syurukTime = _waktuSolat.isNotEmpty ? syuruk : 'N/A';
                                    return syuruk;
                                  },
                                  error: (err, s) => 'error fetching data',
                                  loading: () => 'Fetching Data'),
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Divider(
                        color: white,
                      ),
                    ),
                    Container(
                      //Zuhr
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/zuhr-icon.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Zuhr',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                            Text(
                              _waktuSolat.when(
                                  data: (_waktuSolat) {
                                    String subh = _waktuSolat.zuhr;
                                    // final subhTime = _waktuSolat.isNotEmpty ? subh : 'N/A';
                                    return subh;
                                  },
                                  error: (err, s) => 'error fetching data',
                                  loading: () => 'Fetching Data'),
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Divider(
                        color: white,
                      ),
                    ),
                    Container(
                      //Asr
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/asr-icon.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Asr',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                            Text(
                              _waktuSolat.when(
                                  data: (_waktuSolat) {
                                    String subh = _waktuSolat.asr;

                                    // final subhTime = _waktuSolat.isNotEmpty ? subh : 'N/A';
                                    return subh;
                                  },
                                  error: (err, s) => 'error fetching data',
                                  loading: () => 'Fetching Data'),
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Divider(
                        color: white,
                      ),
                    ),
                    Container(
                      //Maghrib
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/maghrib-icon.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Maghrib',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                            Text(
                              _waktuSolat.when(
                                  data: (_waktuSolat) {
                                    String subh = _waktuSolat.maghrib;

                                    // final subhTime = _waktuSolat. ? subh : 'N/A';
                                    return subh;
                                  },
                                  error: (err, s) => 'error fetching data',
                                  loading: () => 'Fetching Data'),
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Divider(
                        color: white,
                      ),
                    ),
                    Container(
                      //Isya'
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/isha-icon.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Isha',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                            Text(
                              _waktuSolat.when(
                                  data: (_waktuSolat) {
                                    String subh = _waktuSolat.isha;

                                    // final subhTime = _waktuSolat.isNotEmpty ? subh : 'N/A';
                                    return subh;
                                  },
                                  error: (err, s) => 'error fetching data',
                                  loading: () => 'Fetching Data'),
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container topSection(
      BuildContext context, AsyncValue<PrayerTime> _waktuSolat) {

    String currentPrayerName = _waktuSolat.when(
        data: (_waktuSolat) {
          String current = _waktuSolat.determineCurrentPrayer(
              PrayerTime(
              subh: _waktuSolat.subh,
              syuruk: _waktuSolat.syuruk,
              zuhr: _waktuSolat.zuhr,
              asr: _waktuSolat.asr,
              maghrib: _waktuSolat.maghrib,
              isha: _waktuSolat.isha,
              hijriDate: _waktuSolat.hijriDate));
          return current;
        },
        error: (err, s) => 'error!',
        loading: () => '..');
    String nextPrayerTime = _waktuSolat.when(
        data: (_waktuSolat){
          String next = _waktuSolat.getNextPrayer(
              PrayerTime(
              subh: _waktuSolat.subh,
              syuruk: _waktuSolat.syuruk,
              zuhr: _waktuSolat.zuhr,
              asr: _waktuSolat.asr,
              maghrib: _waktuSolat.maghrib,
              isha: _waktuSolat.isha,
              hijriDate: _waktuSolat.hijriDate));
          return next;

        },
        error: (err, s) => 'error!',
        loading: () => '..');

    return Container(
      //Top Container
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(2, 4),
                blurRadius: 2),
          ],
          color: Color(0xffA6C0B3).withOpacity(0.6)),
      child: Padding(
        padding:
        // const EdgeInsets.all(0),
            const EdgeInsets.only(left: 20, right: 25, top: 8.0, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              //top
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        'Current Prayer',
                        style: TextStyle(
                            color: white,
                            fontSize: 13,
                            height: 1.5,
                            shadows: [basicShadow]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Text(
                        currentPrayerName,
                        style: TextStyle(
                            color: white,
                            fontSize: 25,
                            height: 1.0,
                            shadows: [basicShadow]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Text(
                        'Time Left : ',
                        style: TextStyle(
                            color: white,
                            fontSize: 13,
                            height: 2.2,
                            shadows: [basicShadow]),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFFFFFF),
                          Color(0xffFEF0D7),
                          Color(0xffF7A719),
                          Color(0xffF7A719),
                        ],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        _waktuSolat.when(
                            data: (_waktuSolat) {
                              String current = _waktuSolat.getPrayerTime(PrayerTime(
                                  subh: _waktuSolat.subh,
                                  syuruk: _waktuSolat.syuruk,
                                  zuhr: _waktuSolat.zuhr,
                                  asr: _waktuSolat.asr,
                                  maghrib: _waktuSolat.maghrib,
                                  isha: _waktuSolat.isha,
                                  hijriDate: _waktuSolat.hijriDate), currentPrayerName);
                              return current;
                            },
                            error: (err, s) => 'error',
                            loading: () => '00:00 am'),
                        style:  TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors
                              .black, // Use a base color (white is recommended)
                          // shadows: [
                          //   Shadow(
                          //       color: Colors.black.withOpacity(0.25),
                          //       blurRadius: 10,
                          //       offset: Offset(4, 4))
                          // ]
                        ),
                      ),
                    ),
                    Text(
                      _waktuSolat.when(
                          data: (_waktuSolat){
                            return _waktuSolat.calculateTimeLeft(
                                nextPrayerTime,
                                PrayerTime(
                                subh: _waktuSolat.subh,
                                syuruk: _waktuSolat.syuruk,
                                zuhr: _waktuSolat.zuhr,
                                asr: _waktuSolat.asr,
                                maghrib: _waktuSolat.maghrib,
                                isha: _waktuSolat.isha,
                                hijriDate: _waktuSolat.hijriDate));
                          },
                          error: (err,s) => 'error',
                          loading: ()=> '0 hour 0 minutes'),
                      style: TextStyle(
                          color: white,
                          fontSize: 13,
                          shadows: [basicShadow],
                          height: 1),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 500,
              child: Divider(),
            ),
            Column(
              //bottom
              children: [
                Row(
                  children: [
                    Text(
                      'Upcoming Prayer :',
                      style: TextStyle(
                          color: white,
                          fontSize: 13,
                          shadows: [basicShadow],
                          height: 1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nextPrayerTime,
                      style: TextStyle(
                          color: white, fontSize: 19, shadows: [basicShadow]),
                    ),
                    Text(
                      _waktuSolat.when(
                          data: (_waktuSolat) {
                            String current = _waktuSolat.getPrayerTime(PrayerTime(
                                subh: _waktuSolat.subh,
                                syuruk: _waktuSolat.syuruk,
                                zuhr: _waktuSolat.zuhr,
                                asr: _waktuSolat.asr,
                                maghrib: _waktuSolat.maghrib,
                                isha: _waktuSolat.isha,
                                hijriDate: _waktuSolat.hijriDate), nextPrayerTime);
                            return current;
                          },
                          error: (err, s) => 'error fetching data',
                          loading: () => '00:00 pm'),
                      style: TextStyle(
                          color: white, fontSize: 22, shadows: [basicShadow]),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


  SearchBar buildSearchBar() {
    return SearchBar(
      leading: Padding(
        padding: const EdgeInsets.all( 8),
        child:  Icon(
          Icons.search,
          size: 34,
        ),
      ),
      hintText: 'Search Your City..',
      trailing: <Widget>[
        Padding(
          padding: const EdgeInsets.only (right: 8.0),
            child:Icon(
              Icons.pin_drop_outlined,
              size: 34,
            )
        )
      ],
      // onChanged: ,
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: white),
      backgroundColor: Colors.transparent,
      title: Text(
        'Prayer Time',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10,
                  offset: Offset(0, 4))
            ]),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
          onPressed: (){
            showSearch(
            context: context,
            delegate: CustomSearchDelegate(),);
            },
          icon :  Icon(Icons.search_rounded,size: 28,color: white,),
        ),
        )
      ],
    );
  }

}

class CustomSearchDelegate extends SearchDelegate{

  List<String> searchCity = CityZone.getCities();

  @override
  List<Widget> buildActions(BuildContext context){
    return[
      IconButton(
    onPressed: (){
      query = '';
    },
      icon: const Icon(Icons.clear),
    )
    ];
  }
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)
    );
  }
  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];
    for(var city in searchCity){
      if(city.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return InkWell(
            onTap: (){
              print(result);
            },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    for(var city in searchCity){
      if(city.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return InkWell(
          onTap: (){
            print(result);
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }


}