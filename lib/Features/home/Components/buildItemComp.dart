import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';
import 'package:google_fonts/google_fonts.dart';

import 'timerComp.dart';

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
                    SizedBox(
                      width: 130,
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: GoogleFonts.aBeeZee(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
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
                    item.isCompleted
                        ? Container(
                            height: 30,
                            width: 100,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text(
                                "${item.timeInHour} : ${item.timeInMin} : ${item.timeInSec}",
                                style: GoogleFonts.aBeeZee(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        : item.status == "IN PROGRESS"
                            ? TimerWidget(
                                id: item.id,
                                seconds: item.timeInHour * 3600 +
                                    item.timeInMin * 60 +
                                    item.timeInSec,
                              )
                            : Container(),
                  ],
                ),
              ],
            ),
          )),
    ),
  );
}
