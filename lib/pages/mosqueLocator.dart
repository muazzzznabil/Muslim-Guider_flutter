// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:muslim_guider_v1/dataProvider/data_provider.dart';
// import 'package:riverpod/riverpod.dart';
//
// import '../model/mosque_model.dart';
//
//
// class mosqueLocator extends ConsumerWidget {
//   mosqueLocator({super.key});
//
//
//   @override
//   Widget build(BuildContext context, ref) {
//     final data = ref.watch(mosqueDataProvider);
//     return  Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xff50775e),
//               Color(0xff142c28)
//             ]
//           ),
//         ),
//         child: Column(
//           children: [
//             appBar(),
//             SizedBox(height: 30,),
//             currentLocation(),
//             SizedBox(height: 30,),
//             Container(
//               child: data.when(
//                   data: (data){
//                     List<MosqueLocator> mosqueList = data.map((e) => e).toList();
//                     return Column(
//                       children: [
//                         Expanded(child: ListView.builder(
//                           itemCount: mosqueList.length,
//                           itemBuilder: (_,index){
//                             final mosque = data[index];
//                             return Card(
//                               color: Colors.green,
//                               elevation: 4,
//                               margin: const EdgeInsets.symmetric(vertical: 10),
//                               child: ListTile(
//                                 title: Text(
//                                   mosque.name,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         )
//                         )
//                       ],
//                     );
//                   },
//                   error: (err, s) => Text(err.toString()),
//                   loading: () => const Center(
//                     child: CircularProgressIndicator(),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Container currentLocation() {
//     return Container(
//             height: 90,
//             width: 320,
//             decoration: BoxDecoration(
//               color: Color(0xffa6c0b3),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Current Location',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xffffffff)
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(
//                       'assets/icons/redlocation.svg',
//                       width: 25,
//                       color: Colors.red,
//                     ),
//                     SizedBox(width: 3,),
//                     Text(
//                       'Mecca, Saudi Arabia',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Color(0xff302816),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//   }
//
//   AppBar appBar() {
//     return AppBar(
//             backgroundColor: Colors.transparent,
//             centerTitle: true,
//             title: Text(
//               'Mosque Locator',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 24,
//                 color: Color(0xffffffff)
//               ),
//             ),
//           );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod/riverpod.dart';

// Import your provider
import '../dataProvider/data_provider.dart';

class mosqueLocator extends ConsumerWidget {
  mosqueLocator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the list of mosque names
    final mosqueName = ref.watch(mosqueDataProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff50775e), Color(0xff142c28)],
          ),
        ),
        child: Column(
          children: [
            appBar(),
            SizedBox(height: 30),
            currentLocation(),
            SizedBox(height: 30),
            Expanded(
              child: mosqueName.when(
                data: (mosqueName) {
                  return ListView.builder(
                    itemCount: mosqueName.length,
                    itemBuilder: (_, index) {
                      final mosque = mosqueName[index]; // Use a different variable name
                      return Card(
                        color: Colors.green,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            mosque.name, // Use the new variable here
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                error: (err, s) => Text(err.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
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
              color: Color(0xffffffff),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/map-pin-color.svg',
                width: 25,
                color: Colors.red,
              ),
              SizedBox(width: 3),
              Text(
                'Mecca, Saudi Arabia',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xff302816),
                ),
              ),
            ],
          ),
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
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}
