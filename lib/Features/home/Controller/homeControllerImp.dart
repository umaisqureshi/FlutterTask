import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Features/home/Controller/homeController.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';

import '../../../Providers/provider.dart';

class HomeControllerImp extends HomeViewController {
  HomeControllerImp(this.ref);
  Ref ref;

  @override
  Stream<AllTasksModel> getAllTaskList() {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    return fire.collection("Tasks").snapshots().map((event) {
      List<Tasks> allTaskList = [];

      for (var doc in event.docs) {
        allTaskList.add(Tasks.fromMap(doc.data()));
      }
      var todo =
          allTaskList.where((element) => element.status == "To Do").toList();
      var inProgress = allTaskList
          .where((element) => element.status == "In Progress")
          .toList();
      var complete =
          allTaskList.where((element) => element.status == "Complete").toList();

      return AllTasksModel(
          todo: todo, inProgress: inProgress, complete: complete);
    });
  }

  @override
  bool updateTimer(String id, int hour, int min, int sec) {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    fire
        .collection("Tasks")
        .doc(id)
        .update({"timeInHours": hour, "timeInMin": min, "timeInSec": sec})
        .then((value) => true)
        .onError((error, stackTrace) => false);
    return true;
  }

  @override
  bool updateStatus(String id, String status, bool isComplete) {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    fire
        .collection("Tasks")
        .doc(id)
        .update({
          "status": status,
          "isComplete": isComplete,
          "completeAt":
              isComplete ? DateTime.now().millisecondsSinceEpoch : 0
        })
        .then((value) => true)
        .onError((error, stackTrace) => false);
    return true;
  }
}
