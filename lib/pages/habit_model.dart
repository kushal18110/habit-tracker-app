import 'package:hive/hive.dart';

part 'habit_model.g.dart';


@HiveType(typeId: 0)
class habitModel extends HiveObject{
  @HiveField(0)
  late String habitName;

  @HiveField(1)
  late int timeSpent;
  
  @HiveField(2)
  late int goalTime;

  @HiveField(3)
   bool habitStarted;

  @HiveField(4)
 late int storedDay;

  habitModel({required this.habitName, required this.timeSpent, required this.goalTime, this.habitStarted= false, required this.storedDay});
}