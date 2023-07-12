import 'package:flutter/material.dart';

class floatingAddPage extends StatelessWidget {
  floatingAddPage(
      {super.key,
      required this.minController,
      required this.nameController,
      required this.addHabit,
      required this.closeHabitPage});

  final TextEditingController nameController;
  final TextEditingController minController;
  final VoidCallback addHabit;
  final VoidCallback closeHabitPage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(3),
      content: Container(
        decoration: BoxDecoration(color: Colors.grey[800]),
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            //habit name text field
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Habit name',
                  filled: true,
                  fillColor: Colors.grey[100]),
            ),
            const SizedBox(
              height: 10,
            ),

            //habit goal time text field
            TextField(
              controller: minController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'minutes',
                  filled: true,
                  fillColor: Colors.grey[100]),
            ),
            const SizedBox(
              height: 10,
            ),

            //save and cancel container
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                //cancel
                GestureDetector(
                    onTap: closeHabitPage,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text('cancel'),
                    )),
                const SizedBox(
                  width: 10,
                ),

                //add
                GestureDetector(
                    onTap: addHabit,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text('add'),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
