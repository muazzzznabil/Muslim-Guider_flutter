import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_guider_v1/model/tasbih_model.dart';
import 'package:vibration/vibration.dart';

class TasbihProvider extends StateNotifier<List<TasbihRecord>> {
  int _currentCount = 0;
  int _goal = 100;

  TasbihProvider() : super([]);

  int get currentCount => _currentCount;
  int get goal => _goal;

  void incrementCount(BuildContext context) async{
    _currentCount++;
    state = [...state];
      if(_currentCount == _goal){
        Vibration.vibrate(duration: 1000);
        ScaffoldMessenger.of(context).showSnackBar(const  SnackBar
          (content: Text('You have achieved your goal !!'),
          behavior: SnackBarBehavior.floating,));
      }else{
        Vibration.vibrate(duration: 20);
        print('--------------current goal : $goal----------');
      }
  }

  void setGoal(int newGoal) {
    _goal = newGoal;
    _currentCount = 0;
    print('------new GOAL set to $_goal');
    state = [...state];
  }


  void resetCounter() {
    state = [
      ...state,
      TasbihRecord(goal: _goal, count: _currentCount, date: DateTime.now())
    ];
    _currentCount = 0;
  }
}

final tasbihProvider = StateNotifierProvider<TasbihProvider, List<TasbihRecord>>((ref) {
  return TasbihProvider();
});
