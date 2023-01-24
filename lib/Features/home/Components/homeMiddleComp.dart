
import 'package:flutter/material.dart';
import 'package:fluttertask/Features/home/Components/taskAndCountComp.dart';

import '../model/tasksModel.dart';

homeMiddleWidget(List<Tasks> allList, BuildContext context) {
  List<Tasks> completeList = [];

  for (var complete
      in allList.where((element) => element.status == "Complete")) {
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
