import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_guider_v1/test/location_test.dart';

class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40,),
        Row( // to center the item
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/contactUs');
                      },
                     child:Container(
                        width: 270,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row( //Contact us
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/contact-us.svg',width: 24,),
                                  SizedBox(width: 12,),
                                  Text('Contact Us',style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              SvgPicture.asset('assets/icons/navigate_next.svg')
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 300, // Use available width
                      child: Divider(
                        color: Colors.black.withOpacity(0.4),
                        thickness: 0.8,
                        height: 20,
                      ),
                    ),

                    GestureDetector( //about
                      onTap: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      child:Container(
                        width: 270,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/about.svg',width: 24,),
                                  SizedBox(width: 12,),
                                  Text('About',style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              SvgPicture.asset('assets/icons/navigate_next.svg')
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 300, // Use available width
                      child: Divider(
                        color: Colors.black.withOpacity(0.4),
                        thickness: 0.8,
                        height: 20,
                      ),
                    ),
                  ],
                ),




              ],

        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => locationTest()));
          },
          child:
          Container(
            child: Text('Location test'),
            width: 90,
            height: 80,

            color: Colors.orange,
          ),

        )
      ],

    );


  }
}
