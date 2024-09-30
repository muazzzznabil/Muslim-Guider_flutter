import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _urlMuaz = Uri.parse('https://www.instagram.com/muaz.nabil');
final Uri _urlDin = Uri.parse('https://www.instagram.com/fariddinn_');

Future<void> _launchUrlMuaz() async {
  if (!await launchUrl(_urlMuaz)){
    throw Exception('Could not launch $_urlMuaz');
  }
}
Future<void> _launchUrlDin() async {
  if (!await launchUrl(_urlDin)){
    throw Exception('Could not launch $_urlDin');
  }
}


class contactUs extends StatelessWidget {
   contactUs({super.key});

   Shadow basicShadow = Shadow(
       color: Colors.black.withOpacity(0.25),
       blurRadius: 10,
       offset: Offset(4, 4));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          prewords(),
          callUsEmailUs(),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Contact us on Social Media',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: (){
              _launchUrlMuaz();
            },
            child: Container(
              height: 55,
              width: 295,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xfff9ce34),
                      Color(0xffee2a7b),
                      Color(0xff6228d7),
                    ],
                    stops: [0.0,0.5,1.0]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icons/instagram.svg',
                    width: 26,
                  ),
                  Text(
                    'muaz.nabil',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SvgPicture.asset(
                      'assets/icons/share.svg',
                    width: 25,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: (){
              _launchUrlDin();
            },
            child: Container(
              height: 55,
              width: 295,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xfff9ce34),
                      Color(0xffee2a7b),
                      Color(0xff6228d7),
                    ],
                    stops: [0.0,0.5,1.0]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icons/instagram.svg',
                    width: 26,
                  ),
                  Text(
                    'fariddinn_',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SvgPicture.asset(
                      'assets/icons/share.svg',
                    width: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Row callUsEmailUs() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff00ffff),
                    Color(0xffffe53b)
                  ]
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/callnew.svg',
                      width: 30,
                    ),
                    Text(
                      'Call us',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black
                      ),
                    ),
                    Text(
                      'Our Team is on the line',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 8.5,
                        color: Colors.black
                      ),
                    ),
                    Text(
                      'Mon-Fri | 8-17',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffffe53b),
                        Color(0xff00ffff)
                      ]
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/emailnew.svg',
                      height: 32,
                    ),
                    Text(
                      'Email us',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                    Text(
                      'Our Team is on the line',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.5,
                          color: Colors.black
                      ),
                    ),
                    Text(
                      'Mon-Fri | 8-17',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
  }

  Padding prewords() {
    return Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            "Don't hesitate to contact us if you have any suggestion for improvement\t"
                "or any issues that need to be solved.",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Contact Us',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Color(0xff000000),
          shadows: [basicShadow]
        ),
      ),
    );
  }
}
