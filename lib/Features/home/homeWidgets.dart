import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../Widgets/widgets.dart';
import 'model/tasksModel.dart';

buildItem(Tasks item, BuildContext context) {
  return DragAndDropItem(
    child: StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Card(
            elevation: 4,
            color: Colors.teal,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.teal),
            ));
      }
    ),
  );
}

homeTopWidget() {
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
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Flutter Developer",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.notifications_on,
                  color: Colors.white,
                ))
          ],
        )
      ],
    ),
  );
}

homeMiddleWidget(int total, int completed, double percentage) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            taskAndCountWidget(total, completed, completed / total * 100),
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
          percent: percentage / 100,
          center: Text(
            "${percentage.floor()}%",
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

buildList(int outerIndex, List<AllTasksModel> lists, BuildContext context) {
  var innerList = lists[outerIndex];
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
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ],
    ),
    children: List.generate(innerList.children.length,
        (index) => buildItem(innerList.children[index], context)),
  );
}
