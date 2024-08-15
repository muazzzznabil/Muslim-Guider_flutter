import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class tasbihCounter extends StatefulWidget {
  const tasbihCounter({super.key});

  @override
  State<tasbihCounter> createState() => _tasbihCounterState();
}

class _tasbihCounterState extends State<tasbihCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff699b7f),
      appBar: appBar(),
      body: ListView(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '6572',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 64,
                    color: Color(0xffffffff)
                  ),
                ),
                Text(
                  'count',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff)
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  child: Text('Reset'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xffffffff),
                    backgroundColor: Color(0xff8cbe9e),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30
                    ),
                    textStyle: TextStyle(
                      fontSize: 13
                    )
                  ),
                )
              ],
            ),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff345454).withOpacity(0.6),
                  Color(0xffffffff).withOpacity(0)
                ],
              ),
              borderRadius: BorderRadius.circular(40),
            ),
          ),

          //Container untuk record dan set goal
          Container(
            color: Color(0xffffffff),
            height: 388.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Container untuk button record
                    Container(
                      height: 76,
                      width: 127,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.25),
                            offset: const Offset(1, 1),
                            blurRadius: 7.3,
                            spreadRadius: 0
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    //Container untuk button set goal
                    Container(
                      height: 76,
                      width: 127,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff000000).withOpacity(0.25),
                              offset: const Offset(1, 1),
                              blurRadius: 7.3,
                              spreadRadius: 0
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  //AppBar
  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        'Tasbih Counter',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Colors.white, //Kena tukar dalam hexadecimal
        ),
      ),
    );
  }
}
