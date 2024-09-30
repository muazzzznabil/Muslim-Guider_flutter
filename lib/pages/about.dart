import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class aboutPage extends StatelessWidget {
   aboutPage({super.key});

  Shadow basicShadow = Shadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 10,
      offset: Offset(4, 4));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              aboutSection(context),
              Column(
                children: [
                  Text('Muslim Guider',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21
                  ),),
                  SizedBox(height: 20,),
                  Text('Version 1.0.0',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 16.6
                  ),)
                ],
              ),
              SizedBox(height: 0,)

            ],
          ),
        ],
      ),
    );
  }

  Column aboutSection(BuildContext context) {
    return Column( //column ke bawah

          children: [
            SizedBox(height: 20,),
            aboutContainer( //mosque locator
                context,
                '/mosqueLocator',
              'Mosque Locator',
              'Find the nearest mosque for you',
              'about-mosque.svg'
            ),
            SizedBox(height: 20,),
            aboutContainer( //tasbih counter
                context,
                '/tasbihCounter',
                'Tasbih Counter',
                'Your digital mobile tasbih counter',
                'about-prayer-time.svg'
            ),
            SizedBox(height: 20,),
            aboutContainer( //prayer time
                context,
                '/prayerTime',
                'Prayer Time',
                'Track prayer time for your area',
                'about-tasbih.svg'
            ),
          ],
        );
  }

  GestureDetector aboutContainer(
      BuildContext context,
      String page,
      String Name,
      String Description,
      String svgName
      ) {
    return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, page);
              },
              child: Container(
                height: 115,
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow:[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(2, 4),
                        blurRadius: 2),
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row( //row untuk container
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column( //column utk container
                        children: [
                          Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row( // row untk svg dan title container
                                children: [
                                  SvgPicture.asset('assets/icons/$svgName',width: 50,),
                                  SizedBox(width: 7,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                        Name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  Description,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_rounded)
                    ],

                  ),
                ),
              ),
            );
  }



  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text('About',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        shadows: [basicShadow]
      ),),
      centerTitle: true,
    );
  }
}
