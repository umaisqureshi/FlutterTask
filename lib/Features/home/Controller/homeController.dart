import '../model/tasksModel.dart';

abstract class HomeViewController {
  Stream<AllTasksModel> getAllTaskList();
  bool updateTimer(String id, int sec);
  bool updateStatus(String id, String status, bool isComplete);
}
