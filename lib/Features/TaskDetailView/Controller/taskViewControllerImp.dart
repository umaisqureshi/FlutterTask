import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluttertask/Features/TaskDetailView/Controller/taskViewController.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';

import '../../../Providers/provider.dart';

class TaskViewControllerImp extends TaskViewController {
  Ref ref;
  TaskViewControllerImp({
    required this.ref,
  });

  @override
  bool deleteTaskData(String id) {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    fire
        .collection("Tasks")
        .doc(id)
        .delete()
        .then((value) => debugPrint("Task Deleted"))
        .onError((error, stackTrace) => false);
    return true;
  }

  @override
  bool updateTaskData(Tasks task) {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    fire
        .collection("Tasks")
        .doc(task.id)
        .update({
          "name": task.name,
          "project": task.project,
          "description": task.description,
          "status": task.status,
          "id": task.id,
          "time": task.time,
          "assignee": task.assignee,
          "isComplete": task.status == "Complete" ? true : false,
          "completeAt": task.status == "Complete"
              ? DateTime.now().millisecondsSinceEpoch
              : 0,
          "createdAt": task.createdAt
        })
        .then((value) => debugPrint("Task Updated"))
        .onError((error, stackTrace) => false);

    return true;
  }
}
