import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_guider_v1/model/tasbih_model.dart';

class TasbihProvider extends StateNotifier<List<TasbihRecord>> {
  int _currentCount = 0;
  int _goal = 100;

  TasbihProvider() : super([]);

  int get currentCount => _currentCount;
  int get goal => _goal;

  void incrementCount() {
    _currentCount++;
    state = [...state]; // This will trigger a rebuild
  }

  void setGoal(int newGoal) {
    _goal = newGoal;
    _currentCount = 0; // Optionally reset count when goal is changed
    state = [...state]; // Trigger a rebuild after setting goal
  }

  void resetCounter() {
    state = [
      ...state,
      TasbihRecord(goal: _goal, count: _currentCount, date: DateTime.now())
    ]; // Add record and update the state
    _currentCount = 0;
  }
}

final tasbihProvider = StateNotifierProvider<TasbihProvider, List<TasbihRecord>>((ref) {
  return TasbihProvider();
});
