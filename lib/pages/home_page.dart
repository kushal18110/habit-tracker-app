import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/edit_habit_page.dart';
import 'package:habit_tracker/pages/habit_provider.dart';
import 'package:habit_tracker/pages/habit_tile.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'floating_add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference of box
  final habitBox = Hive.box('habits');

  //getting hapits
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //getting habits
    Provider.of<habits>(context, listen: false).getHabits();
  }

  // controllers
  TextEditingController _addNameController = TextEditingController();
  TextEditingController _addMinController = TextEditingController();
  TextEditingController _editMinController = TextEditingController();
  TextEditingController _editNameController = TextEditingController();

  //create newHabit
  void createHabit() {
    DateTime currentTime = DateTime.now();
    int currentDay = currentTime.day;
    if (_addNameController.text != '' && _addMinController.text != '') {
      Provider.of<habits>(context, listen: false).createHabit(
          _addNameController.text,
          0,
          int.parse(_addMinController.text),
          false,
          currentDay);

      closeContext();
    }
  }

  void closeContext() {
    Navigator.pop(context);
  }

  //floating buttion action
  void floatingAddhabit() {
    showDialog(
        context: context,
        builder: (context) {
          return floatingAddPage(
            nameController: _addNameController,
            minController: _addMinController,
            addHabit: () => createHabit(),
            closeHabitPage: closeContext,
          );
        });

    _addNameController.clear();
    _addMinController.clear();
  }

  //setting icon open action
  void settingOpen(String habitName, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return editHabitPage(
            habitName: habitName,
            editNameController: _editNameController,
            editMinController: _editMinController,
            onSaveEdit: () => onSaveEdit(index),
            onDeleteHabit: () => onDeleteHabit(index),
            close: closeContext,
          );
        });
    _editNameController.clear();
  }

  //saving edit done by user
  void onSaveEdit(int index) {
    if (_editNameController != '' && _editMinController != '') {
      Provider.of<habits>(context, listen: false).updateHabit(
          _editNameController.text, int.parse(_editMinController.text), index);
      closeContext();
    }
  }

  //delete icon tapped action
  void onDeleteHabit(int index) {
    Provider.of<habits>(context, listen: false).deleteHabit(index);
    // Provider.of<habits>(context,listen: false).clearHabits();
    closeContext();
  }

  @override
  Widget build(BuildContext context) {
    //reference of habits provide
    var provider = Provider.of<habits>(context, listen: false);
    return Scaffold(
      //floating action button
      floatingActionButton: FloatingActionButton(
        //on pressed function
        onPressed: floatingAddhabit,
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.add),
      ),

      //app bar
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('habit tracker'),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[300],

      //main body
      body: Consumer<habits>(builder: (context, value, child) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: value.habitList.length,
                  itemBuilder: (context, index) {
                    final values = value.habitList[index];

                    //habit tile
                    return HabitTile(
                      name: values.habitName,
                      timeSpent: values.timeSpent,
                      goalTime: values.goalTime,
                      onTap: () => provider.habitStarted(index),
                      settingTap: () => settingOpen(values.habitName, index),
                      habitStarted: values.habitStarted,
                    );
                  }),
            )
          ],
        );
      }),
    );
  }
}
