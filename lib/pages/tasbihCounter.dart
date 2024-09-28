import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_guider_v1/dataProvider/counter_provider.dart';

class TasbihCounter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state (which is a list of TasbihRecord)
    final tasbihRecords = ref.watch(tasbihProvider);
    final currentCount = ref.watch(tasbihProvider.notifier).currentCount;
    // Watch the notifier to listen for state changes (e.g., the count)
    final tasbih = ref.watch(tasbihProvider.notifier);

    return Scaffold(
      appBar: appBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff699b7f),
              Color(0xffffffff),
            ],
            stops: [0.0, 0.80],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _countTasbih(context, currentCount, tasbih),
            _recordsAndGoals(context, tasbih),
          ],
        ),
      ),
    );
  }

  Container _countTasbih(
      BuildContext context, int tasbihCount, TasbihProvider tasbih) {
    // Fetch current count from TasbihProvider and convert to string
    String countString = tasbihCount.toString();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                countString,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 64,
                    color: Color(0xffffffff)),
              ),
              Text(
                'count',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff)),
              ),
            ],
          ),
          SizedBox(
            width: 125,
            child: TextButton(
              onPressed: () {
                tasbih.resetCounter(); // Reset counter
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                foregroundColor: Color(0xffffffff),
                backgroundColor: Color(0xff8cbe9e),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                textStyle: TextStyle(fontSize: 13),
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

  Container _recordsAndGoals(BuildContext context, TasbihProvider tasbih) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xffffffff),
      height: screenHeight * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tasbihRecords');
                },
                child: _buttonContainer(
                  iconPath: 'assets/icons/records.svg',
                  label: 'Records',
                ),
              ),
              GestureDetector(
                  onTap: () {

                  },
                  child: CustomPopup(
                      content: _Slider(),
                      child:_buttonContainer(
                        iconPath: 'assets/icons/goal.svg',
                        label: 'Set Goal',
                      )
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  tasbih.incrementCount(context); // Increment the count
                },
                child: SvgPicture.asset('assets/icons/add-square-button.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buttonContainer(
      {required String iconPath, required String label}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(iconPath),
          Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
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
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(0xff699b7f),
      centerTitle: true,
      title: const Text(
        'Tasbih Counter',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}


class _Slider extends ConsumerStatefulWidget {
  const _Slider({Key? key}) : super(key: key);

  @override
  ConsumerState<_Slider> createState() => __SliderState();
}

class __SliderState extends ConsumerState<_Slider> {
  double progress = 0;
  int goalVal = 0;

  Shadow basicShadow = Shadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 10,
      offset: const Offset(4, 4));

  @override
  void initState(){
    super.initState();

    final currentGoal = ref.read(tasbihProvider.notifier).goal;
    setState(() {
      progress = currentGoal / 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    double valSlide = 0;

    return SizedBox(
      width: 300,
      height: 100,
      child: Column(
        children: [
          // Slider to set the goal value dynamically
          Slider(
            value: progress,
            onChanged: (value) {
              setState(() {
                // double currentGoal = ref.read(tasbihProvider.notifier).goal/1000;
                progress = value;

                double progressVal = value * 1000;
                goalVal = progressVal.round();

                ref.read(tasbihProvider.notifier).setGoal(goalVal);
              });
              double progressVal = value * 1000;
                print('Goal set to: ${progressVal.round()}');
            },
          ),

          Text(

            ('${(progress*1000).round()}'),
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              shadows: [basicShadow],
            ),
          )
        ],
      ),
    );
  }
}
