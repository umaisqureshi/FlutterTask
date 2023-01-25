import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:flutter/material.dart';

import '../model/tasksModel.dart';
import 'buildItemComp.dart';


  buildList(int outerIndex, BuildContext context, List<AllTasksModel> list) {
    var lists = list[outerIndex];
    //  var completeList =
    //     AllTasksModel(children: ref.watch(completeTaskListProvider));

    // var todoList = AllTasksModel(children: ref.watch(todoTaskListProvider));
    // var inProgressList =
    //     AllTasksModel(children: ref.watch(inProgressTaskListProvider));

    //     completeList
    //     .addAll(value.where((element) => element.status == "Complete"));
    // inProgressList
    //     .addAll(value.where((element) => element.status == "In Progress"));
    // todoList.addAll(value.where((element) => element.status == "Todo"));

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
          lists.children.length,
          // outerIndex == 0 && todoList.isNotEmpty
          //     ? todoList.length
          //     : outerIndex == 1 && inProgressList.isNotEmpty
          //         ? inProgressList.length
          //         : outerIndex == 2 && completeList.isNotEmpty
          //             ? completeList.length
          //             : 0,
          (index) => buildItem(
              outerIndex == 0 && lists.children.isNotEmpty
                  ? lists.children[index]
                  : outerIndex == 1
                      ? lists.children[index]
                      : outerIndex == 2
                          ? lists.children[index]
                          : [] as Tasks,

              // (index) => buildItem(
              //     lists.children[index],
              context,
              outerIndex == 0
                  ? const Color(0xff226089)
                  : outerIndex == 1
                      ? const Color(0xff4592af)
                      : Colors.teal)),
    );
  }

