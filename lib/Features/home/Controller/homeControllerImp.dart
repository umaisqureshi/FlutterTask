import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Features/home/Controller/homeController.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';

import '../../../Providers/firebaseProvider.dart';


final allTaskListProvider = StreamProvider<List<Tasks>>((ref) {
  return HomeControllerImp(ref).getAllTaskList();
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
}
