import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  HabitTile(
      {super.key,
      required this.name,
      required this.timeSpent,
      required this.goalTime,
      required this.onTap,
      required this.settingTap,
      required this.habitStarted});

  final String name;
  final int timeSpent;
  final int goalTime;
  final VoidCallback onTap;
  final VoidCallback settingTap;
  final bool habitStarted;

  @override
  Widget build(BuildContext context) {
    String convertTime(int totalSeconds) {
      String secs = (totalSeconds % 60).toString();
      String mins = (totalSeconds / 60).toStringAsFixed(1);

      if (secs.length == 1) {
        secs = '0' + secs;
      }

      if (mins[1] == '.') {
        mins = mins.substring(0, 1);
      }

      if (mins.length == 2) {}

      return mins + ':' + secs;
    }

    double percentage() {
      return timeSpent / (goalTime * 60);
    }

    //tile
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border:
            percentage() >= 1 ? Border.all(color: Colors.green.shade300) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: Stack(
                    children: [
                      //percent indicator
                      CircularPercentIndicator(
                        radius: 23,
                        percent: percentage() < 1 ? percentage() : 1,
                        progressColor: percentage() < 0.5
                            ? (percentage() > 0.25
                                ? Colors.orange[200]
                                : Colors.grey[800])
                            : Colors.green,
                      ),

                      //paly pause icon
                      Center(
                          child: Icon(
                              habitStarted ? Icons.pause : Icons.play_arrow))
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: 15,
              ),
              //name and time
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //habit name
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //time
                  Text(
                      '${convertTime(timeSpent)} / $goalTime:00 =  ${(percentage() * 100).toStringAsFixed(0)} % ')
                ],
              ),
            ],
          ),

          //settings icon
          GestureDetector(
            onTap: settingTap,
            child: Icon(
              Icons.settings,
              color: Colors.grey[700],
            ),
          )
        ],
      ),
    );
  }
}
