import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class prayerTime extends StatelessWidget {
  prayerTime({super.key});

  Color white = Colors.white;

  Shadow basicShadow = Shadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 10,
      offset: Offset(4, 4));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff67987c),
      appBar: appBar(),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/prayTimeBg.png'),
                  opacity: 0.9,
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        //Search Bar
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: buildSearchBar(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      topSection(context), //topSection
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        //bottom section
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.5,
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
                                      ' Kuala Terengganu',
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Divider(),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(//Subh
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0, right: 40),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/subh-icon.svg'),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'Subh',
                                                    style:
                                                        TextStyle(color: white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                '06:10 pm',
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
                                      Container(//Syuruk
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0, right: 40),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/syuruk-icon.svg'),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'Syuruk',
                                                    style:
                                                        TextStyle(color: white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                '07:10 pm',
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
                                      Container( //Zuhr
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0, right: 40),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/zuhr-icon.svg'),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'Zuhr',
                                                    style:
                                                        TextStyle(color: white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                '01:15 pm',
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
                                      Container( //Asr
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0, right: 40),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/asr-icon.svg'),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'Asr',
                                                    style:
                                                        TextStyle(color: white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                '04:45 pm',
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
                                      Container( //Maghrib
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0, right: 40),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/maghrib-icon.svg'),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'Maghrib',
                                                    style:
                                                        TextStyle(color: white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                '07:20 pm',
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
                                      Container( //Isya'
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 40),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/isha-icon.svg'),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'Isha',
                                                    style:
                                                        TextStyle(color: white),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                '08:40 pm',
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
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }

  Container topSection(BuildContext context) {
    return Container(
      //Top Container
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
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
            const EdgeInsets.only(left: 20, right: 25, top: 8.0, bottom: 8),
        child: Column(
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
                    Text(
                      'maghrib',
                      style: TextStyle(
                          color: white,
                          fontSize: 25,
                          height: 1.0,
                          shadows: [basicShadow]),
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
                      height: 8,
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
                        '07:20 pm',
                        style: TextStyle(
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
                      '1 hour 20 minutes',
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
                      'Isha',
                      style: TextStyle(
                          color: white, fontSize: 19, shadows: [basicShadow]),
                    ),
                    Text(
                      '08:40 pm',
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
        padding: const EdgeInsets.only(bottom: 6.0, left: 8),
        child: SvgPicture.asset(
          'assets/icons/map-pin-black.svg',
          width: 30,
        ),
      ),
      hintText: 'Search Your City..',
      trailing: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.search,
            size: 34,
          ),
        )
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
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
    );
  }
}
