import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class tasbihRecords extends StatelessWidget {
  const tasbihRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff699e7f),
                Color(0xff4f765f),
                Color(0xff25382d)
              ]
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                'Records',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff)
                ),
              ),
            ),

            ListView.builder(
              itemBuilder: (context,index){
                return Container(

                );
              },
              scrollDirection: Axis.vertical,

            ),
          ],
        ),
      ),

    );
  }
}
