import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/tasksModel.dart';

abstract class HomeViewController {
  Stream<List<Tasks>> getTodoTaskList();
  Stream<List<Tasks>> getInProgressTaskList();
  Stream<List<Tasks>> getCompletedTaskList();
}
