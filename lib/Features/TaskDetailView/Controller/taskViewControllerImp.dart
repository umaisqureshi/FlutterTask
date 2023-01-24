import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluttertask/Features/TaskDetailView/Controller/taskViewController.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';

import '../../../Providers/firebaseProvider.dart';

final updateTasksProvider = Provider.family<bool, Tasks>((ref, task) {
  return TaskViewControllerImp(ref: ref).updateTaskData(task);
});

final deleteTaskProvider = Provider.family<bool, String>((ref, id) {
  return TaskViewControllerImp(ref: ref).deleteTaskData(id);
});

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
          "timeInHour": task.timeInHour,
          "timeInMin": task.timeInMin,
          "timeInSec": task.timeInSec,
          "assignee": task.assignee,
          "isComplete": task.isCompleted,
          "createdAt": task.time
        })
        .then((value) => debugPrint("Task Updated"))
        .onError((error, stackTrace) => false);

    return true;
  }
}
