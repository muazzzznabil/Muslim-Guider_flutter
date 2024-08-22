import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod/riverpod.dart';


class mosqueLocator extends ConsumerWidget {
  mosqueLocator({super.key});


  @override
  Widget build(BuildContext context, ref) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff50775e),
              Color(0xff142c28)
            ]
          ),
        ),
        child: Column(
          children: [
            appBar(),
            SizedBox(height: 30,),
            currentLocation(),
            SizedBox(height: 30,),
            Container(
              // child: ListView.separated(
              //     itemBuilder: (context,index){
              //       return Container();
              //     },
              //     separatorBuilder: (context, index) => const SizedBox(height: 25,),
              //     scrollDirection: Axis.vertical,
              //     padding: const EdgeInsets.only(
              //       left: 20,
              //       right: 20
              //     ),
              //     itemCount: itemCount),
            )
          ],
        ),
      ),
    );
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
                    color: Color(0xffffffff)
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/redlocation.svg',
                      width: 25,
                      color: Colors.red,
                    ),
                    SizedBox(width: 3,),
                    Text(
                      'Mecca, Saudi Arabia',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xff302816),
                      ),
                    )
                  ],
                )
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
                color: Color(0xffffffff)
              ),
            ),
          );
  }
}

