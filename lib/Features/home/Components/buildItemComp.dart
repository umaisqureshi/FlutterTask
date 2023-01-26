import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'timerComp.dart';

buildItem(AppFlowyGroupItem item, BuildContext context) {
  if (item is Tasks) {
    double height =
        (item.status == "In Progress" || item.status == "Complete") ? 110 : 100;

    DateTime formattedDate =
        DateTime.fromMillisecondsSinceEpoch(item.createdAt);
    DateTime formattedCompletedDate =
        DateTime.fromMillisecondsSinceEpoch(item.completeAt);

    return GestureDetector(
      onTap: () {
        context.push("/TASKVIEW", extra: item);
      },
      child: Card(
        elevation: 5,
        color: Theme.of(context).backgroundColor,
        child: Container(
            key: ValueKey(item.id),
            height: height,
            width: 330,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
                color: Theme.of(context).primaryColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        color: Theme.of(context).backgroundColor,
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
                      item.isCompleted
                          ? Text(
                              "Complete at : ${formattedCompletedDate.day.toString()}-${formattedCompletedDate.month.toString()}-${formattedCompletedDate.year.toString()}",
                              style: GoogleFonts.aBeeZee(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            )
                          : Text(
                              "Created at : ${formattedDate.day.toString()}-${formattedDate.month.toString()}-${formattedDate.year.toString()}",
                              style: GoogleFonts.aBeeZee(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                          : item.status == "In Progress"
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
}
