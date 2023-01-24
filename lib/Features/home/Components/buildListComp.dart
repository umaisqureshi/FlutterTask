import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:flutter/material.dart';

import '../model/tasksModel.dart';
import 'buildItemComp.dart';

buildList(int outerIndex, List<Tasks> lists, BuildContext context) {
  List<Tasks> completeList = [];
  List<Tasks> todoList = [];
  List<Tasks> inProgressList = [];

  for (var complete in lists.where((element) => element.status == "Complete")) {
    completeList.add(complete);
  }

  for (var todo in lists.where((element) => element.status == "Todo")) {
    todoList.add(todo);
  }

  for (var inProgress
      in lists.where((element) => element.status == "In Progress")) {
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
                : outerIndex == 2 && completeList.isNotEmpty
                    ? completeList.length
                    : 0,
        (index) => buildItem(
            outerIndex == 0 && todoList.isNotEmpty
                ? todoList[index]
                : outerIndex == 1 && inProgressList.isNotEmpty
                    ? inProgressList[index]
                    : outerIndex == 2 && completeList.isNotEmpty
                        ? completeList[index]
                        : [] as Tasks,
            context,
            outerIndex == 0
                ? const Color(0xff226089)
                : outerIndex == 1
                    ? const Color(0xff4592af)
                    : Colors.teal)),
  );
}
