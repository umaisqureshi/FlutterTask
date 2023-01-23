import '../model/tasksModel.dart';

abstract class HomeViewController {
  Stream<List<Tasks>> getAllTaskList();
}
