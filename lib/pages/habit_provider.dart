import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/habit_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class habits extends ChangeNotifier {
  //reference box
  final habitBox = Hive.box('habits');

  //habit list
  List<habitModel> habitList = [];

  

  // add habit
  void createHabit(
      String name, int timeSpent, int goalTime, bool habitStarted, int storedDay) {
    //new habit
    habitModel newHabit = habitModel(
        habitName: name,
        timeSpent: timeSpent,
        goalTime: goalTime,
        habitStarted: habitStarted,
        storedDay: storedDay);

    habitList.add(newHabit);
    habitBox.add(newHabit);
    //  habitBox.clear();
    notifyListeners();
  }

  //getting current date
  DateTime currentDate= DateTime.now();

  //getting habits
  void getHabits() {
  int currentDay=currentDate.day;
    for (int i = 0; i < habitBox.length; i++) {
      habitModel habit = habitBox.getAt(i) as habitModel;
      habitList.add(habit);
      if(habit.storedDay != currentDay){
        habit.timeSpent = 0;
        habit.storedDay= currentDay;
      }
    }
  }

  //habit started bool change
  void habitStarted(int index) {
    //storing start time of habit
    var startTime = DateTime.now();

    int elapsedTime = habitList[index].timeSpent;
    //play pause icon change
    habitList[index].habitStarted = !habitList[index].habitStarted;

    //reference of current habit
    habitModel habit = habitBox.get(index);

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (habitList[index].habitStarted == false) {
        timer.cancel();

        //storing elapsed time
      } else {
        var currentTime = DateTime.now();
        habitList[index].timeSpent = elapsedTime +
            currentTime.second -
            startTime.second +
            60 * (currentTime.minute - startTime.minute) +
            60 * 60 * (currentTime.hour - startTime.hour);
        notifyListeners();
      }
    });

        habit.timeSpent = elapsedTime;
        habitBox.put(index, habit);
    notifyListeners();
  }


  //updating habit
  void updateHabit(String name,int goal, int index) {
    //getting current habit
    habitModel current = habitBox.get(index);
    //changing name
    current.habitName = name;
    current.goalTime=goal;

    //putting in box
    habitBox.put(index, current);
    notifyListeners();
  }

  //delete habit
  void deleteHabit(int index) {
    habitBox.deleteAt(index);
    habitList.removeAt(index);
    notifyListeners();
  }


  //clearing habits
  void clearHabits(){
    habitBox.clear();
    habitList.clear();
    notifyListeners();
  }

  
}
