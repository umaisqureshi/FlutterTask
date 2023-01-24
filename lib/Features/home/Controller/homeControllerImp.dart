import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Features/home/Controller/homeController.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';

import '../../../Providers/firebaseProvider.dart';

final allTaskListProvider = StreamProvider<List<Tasks>>((ref) {
  return HomeControllerImp(ref).getAllTaskList();
});

final timeUpdateProvider = Provider.family<bool, TimerModel>((ref, timer) {
  return HomeControllerImp(ref)
      .updateTimer(timer.id, timer.hour, timer.min, timer.sec);
});

final statusUpdateProvider = Provider.family<bool, UpdateStatus>((ref, status) {
  return HomeControllerImp(ref)
      .updateStatus(status.id,status.status);
});

class HomeControllerImp extends HomeViewController {
  HomeControllerImp(this.ref);
  Ref ref;

  @override
  Stream<List<Tasks>> getAllTaskList() {
    final fire = ref.read(firebaseInstanceProvider).firestore;
    return fire.collection("Tasks").snapshots().map((event) {
      List<Tasks> allTaskList = [];
      for (var doc in event.docs) {
        allTaskList.add(Tasks.fromMap(doc.data()));
      }
      return allTaskList;
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
  bool updateStatus(String id, String status) {
    final fire = ref.read(firebaseInstanceProvider).firestore;
fire
        .collection("Tasks")
        .doc(id)
        .update({"status": status})
        .then((value) => true)
        .onError((error, stackTrace) => false);
    return true;
  }
}
