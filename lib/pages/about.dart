import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class aboutPage extends StatelessWidget {
  const aboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column( //column ke bawah

            children: [

              Container(
                height: 120,
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
                            children: [
                              Row( // row untk svg dan title container
                                children: [
                                  SvgPicture.asset('assets/icons/mosque-islam1.svg',width: 50,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                        'Mosque Locator',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  'Find the nearest mosque for you',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200
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
              )
            ],
          ),
        ],
      ),

    );
  }



  AppBar appBar() {
    return AppBar(
      title: Text('About'),
      centerTitle: true,
    );
  }
}
