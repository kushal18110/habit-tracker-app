import 'package:flutter/material.dart';

class editHabitPage extends StatelessWidget {
  const editHabitPage(
      {super.key,
      required this.habitName,
      required this.editNameController,
      required this.editMinController,
      required this.onSaveEdit,
      required this.onDeleteHabit,
      required this.close});
  final String habitName;
  final TextEditingController editNameController;
  final TextEditingController editMinController;
  final VoidCallback onSaveEdit;
  final VoidCallback onDeleteHabit;
  final VoidCallback close;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(5),
      content: Container(
        decoration: BoxDecoration(color: Colors.grey[800]),
        padding: const EdgeInsets.all(10),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //habit name and delete icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings for \'${habitName}\'',
                  style: TextStyle(color: Colors.grey[200]),
                ),
                GestureDetector(

                  //on delete funation
                  onTap: onDeleteHabit,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(4)),
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            //edit habit name text field
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]),
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: editNameController,
                decoration: const InputDecoration(
                  // filled: true,
                  // fillColor: Colors.grey[200],
                  hintText: 'edit name',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //edit goal time text field
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]),
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: editMinController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // filled: true,
                  // fillColor: Colors.grey[200],
                  hintText: 'minutes',
                  
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //cancel and save container 
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: close,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text('cancel'),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: onSaveEdit,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text('save'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
