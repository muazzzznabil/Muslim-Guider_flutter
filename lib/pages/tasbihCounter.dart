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
          //Container tasbih Counter
          _countTasbih(),
          //Container untuk record dan set goal
          _recordsAndGoals(),
          //Container untuk button tambah
        ],
      ),
    );
  }

  Container _recordsAndGoals() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
          color: Color(0xffffffff),
          height: 420,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Container untuk button record
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/tasbihRecords');
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/records.svg'
                          ),
                          Center(
                            child: Text(
                              'Records',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000)
                              ),
                            ),
                          ),
                        ],
                      ),
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
                  ),


                  //Container untuk button set goal
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/goal.svg'
                          ),
                          Center(
                            child: Text(
                              'Set Goal',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),
                                  fontSize: 16
                              ),
                            ),
                          ),
                        ],
                      ),
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
                  ),

                ],
              ),

              //Button untuk counting
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: SvgPicture.asset(
                      'assets/icons/add-square-button.svg'
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
  }

  Container _countTasbih() {
    return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
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
                ],
              ),

              SizedBox(
                width: 125,
                child: TextButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Reset',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      // SvgPicture.asset(
                      //   'assets/icons/reset.svg'
                      // ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xffffffff),
                    backgroundColor: Color(0xff8cbe9e),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    textStyle: TextStyle(
                      fontSize: 13
                    )
                  ),
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
