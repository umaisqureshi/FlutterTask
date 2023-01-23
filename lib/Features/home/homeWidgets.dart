import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../Widgets/widgets.dart';
import 'model/tasksModel.dart';

buildItem(Tasks item, BuildContext context, Color color) {
  double height = item.status == "IN PROGRESS" ? 110 : 100;
  return DragAndDropItem(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          key: ValueKey(item.id),
          height: height,
          width: 330,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
              color: color),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.checklist,
                      color: color,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      item.project,
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Created at : ${item.time.toDate().day.toString()}-${item.time.toDate().month.toString()}-${item.time.toDate().year.toString()}",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    item.status == "IN PROGRESS"
                        ? const TimerWidget()
                        : Container(),
                  ],
                ),
              ],
            ),
          )),
    ),
  );
}

class TimerWidget extends ConsumerStatefulWidget {
  const TimerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  int startTime = 0;
  late int endTime;
  late int elapsedTime;
  bool isStarted = false;
  Timer time = Timer(const Duration(), (() {}));
  // Duration duration = const Duration();
  void startAndStopTimer({required bool start}) {
    if (start) {
      setState(() {
        isStarted = true;
      });
      time = Timer.periodic(const Duration(seconds: 1), (timer) {
        startTime++;
        // duration = Duration(seconds: startTime);
        setState(() {});
      });
    }
    if (!start) {
      setState(() {
        isStarted = false;
      });
      time.cancel();
      // endTime = DateTime.now().second;
      // elapsedTime = endTime - startTime;
    }
  }

  String formatToHourMinSec(int value) {
    String sec = (value % 60).toString();
    String min = (value / 60).toStringAsFixed(5);
    String hour = (value / 3600).toStringAsFixed(5);
    if (sec.length == 1) {
      sec = '0$sec';
    }

    if (min[1] == '.') {
      min = min.substring(0, 1);
    }
    if (hour[1] == '.') {
      hour = hour.substring(0, 1);
    }
    return "$hour : $min : $sec";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => isStarted
                  ? startAndStopTimer(start: false)
                  : startAndStopTimer(start: true),
              child: Icon(
                isStarted ? Icons.pause : Icons.play_circle,
                size: 30,
                color: isStarted ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: 100,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  formatToHourMinSec(startTime),
                  style: GoogleFonts.aBeeZee(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget buildTime(
  String header,
) {
  return Text(header);
}

homeTopWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Card(
                  shape: const StadiumBorder(),
                  elevation: 5,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: imageWidget("assets/umais.jpeg", 80))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Umais Qureshi",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Flutter Developer",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: (() {}),
                icon: Icon(
                  Icons.notifications_on,
                  color: Theme.of(context).colorScheme.onBackground,
                ))
          ],
        )
      ],
    ),
  );
}

homeMiddleWidget(List<Tasks> allList, BuildContext context) {
  List<Tasks> completeList = [];

  for (var complete
      in allList.where((element) => element.status == "COMPLETE")) {
    completeList.add(complete);
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            taskAndCountWidget(
                allList.length,
                completeList.length,
                (completeList.length / allList.length * 100).isNaN
                    ? 0.0
                    : completeList.length / allList.length * 100),
          ],
        ),
      ),
    ),
  );
}

Widget taskAndCountWidget(int total, int completed, double percentage) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Daily Plan",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Almost Done",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$completed of ${total} completed",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        const SizedBox(
          width: 80,
        ),
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 15.0,
          animation: true,
          percent: (percentage / 100).isNaN ? 0.0 : percentage / 100,
          center: Text(
            percentage.isNaN ? "0%" : "${percentage.floor()}%",
            style: GoogleFonts.aBeeZee(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          progressColor: Colors.white,
          circularStrokeCap: CircularStrokeCap.round,
        )
      ],
    ),
  );
}

buildList(int outerIndex, List<Tasks> lists, BuildContext context) {
  List<Tasks> completeList = [];
  List<Tasks> todoList = [];
  List<Tasks> inProgressList = [];

  for (var complete in lists.where((element) => element.status == "COMPLETE")) {
    completeList.add(complete);
  }

  for (var todo in lists.where((element) => element.status == "TODO")) {
    todoList.add(todo);
  }

  for (var inProgress
      in lists.where((element) => element.status == "IN PROGRESS")) {
    inProgressList.add(inProgress);
  }
  return DragAndDropList(
    header: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              outerIndex == 0
                  ? "To Do"
                  : outerIndex == 1
                      ? "In Progress"
                      : "Completed",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ),
      ],
    ),
    children: List.generate(
        outerIndex == 0 && todoList.isNotEmpty
            ? todoList.length
            : outerIndex == 1 && inProgressList.isNotEmpty
                ? inProgressList.length
                : completeList.isNotEmpty
                    ? completeList.length
                    : 1,
        (index) => buildItem(
            outerIndex == 0 && todoList.isNotEmpty
                ? todoList[index]
                : outerIndex == 1 && inProgressList.isNotEmpty
                    ? inProgressList[index]
                    : completeList.isNotEmpty
                        ? completeList[index]
                        : Tasks(
                            name: "No Task",
                            project: "no name",
                            description: "Nothing created yet",
                            id: "id",
                            status: "NOT",
                            time: Timestamp.now()),
            context,
            outerIndex == 0
                ? const Color(0xff226089)
                : outerIndex == 1
                    ? const Color(0xff4592af)
                    : Colors.teal)),
  );
}
