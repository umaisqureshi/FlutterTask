import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Features/home/Controller/homeController.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';

import '../../../Providers/firebaseProvider.dart';

final todoListProvider = StreamProvider<List<Tasks>>((ref) {
  return HomeControllerImp(ref).getTodoTaskList();
});

final inProgressListProvider = StreamProvider<List<Tasks>>((ref) {
  return HomeControllerImp(ref).getInProgressTaskList();
});

final completeListProvider = StreamProvider<List<Tasks>>((ref) {
  return HomeControllerImp(ref).getCompletedTaskList();
});

class HomeControllerImp extends HomeViewController {
  HomeControllerImp(this.ref);
  Ref ref;

  @override
  Stream<List<Tasks>> getCompletedTaskList() {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    return fire
        .collection("Tasks")
        .where("status", isEqualTo: "COMPLETED")
        .snapshots()
        .map((event) {
      List<Tasks> completedList = [];
      for (var doc in event.docs) {
        completedList.add(Tasks.fromMap(doc.data()));
      }
      return completedList;
    });
  }

  @override
  Stream<List<Tasks>> getInProgressTaskList() {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    return fire
        .collection("Tasks")
        .where("status", isEqualTo: "IN PROGRESS")
        .snapshots()
        .map((event) {
      List<Tasks> inProgressList = [];
      for (var doc in event.docs) {
        inProgressList.add(Tasks.fromMap(doc.data()));
      }
      return inProgressList;
    });
  }

  @override
  Stream<List<Tasks>> getTodoTaskList() {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    return fire
        .collection("Tasks")
        .where("status", isEqualTo: "TODO")
        .snapshots()
        .map((event) {
      List<Tasks> todoList = [];
      for (var doc in event.docs) {
        todoList.add(Tasks.fromMap(doc.data()));
      }
      return todoList;
    });
  }
}
