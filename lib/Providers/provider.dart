import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Features/CreateTask/Controller/CreateTaskControllerImp.dart';
import '../Features/TaskDetailView/Controller/taskViewControllerImp.dart';
import '../Features/home/Controller/homeControllerImp.dart';
import '../Features/home/model/tasksModel.dart';

final firebaseInstanceProvider = Provider((ref) {
  return FirebaseProviders();
});
final updateTasksProvider = Provider.family<bool, Tasks>((ref, task) {
  return TaskViewControllerImp(ref: ref).updateTaskData(task);
});

final deleteTaskProvider = Provider.family<bool, String>((ref, id) {
  return TaskViewControllerImp(ref: ref).deleteTaskData(id);
});
final allTaskListProvider = StreamProvider<AllTasksModel>((ref) {
  return HomeControllerImp(ref).getAllTaskList();
});

final timeUpdateProvider = Provider.family<bool, TimerModel>((ref, timer) {
  return HomeControllerImp(ref)
      .updateTimer(timer.id, timer.hour, timer.min, timer.sec);
});

final statusUpdateProvider = Provider.family<bool, UpdateStatus>((ref, stat) {
  return HomeControllerImp(ref).updateStatus(stat.id, stat.status);
});

final createTaskControllerProvider = Provider((ref) {
  return CreateTaskControllerImp(ref);
});
class FirebaseProviders {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
