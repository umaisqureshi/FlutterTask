import '../model/tasksModel.dart';

abstract class HomeViewController {
  Stream<AllTasksModel> getAllTaskList();
  bool updateTimer(String id, int hour, int min, int sec);
  bool updateStatus(String id, String status);
}
