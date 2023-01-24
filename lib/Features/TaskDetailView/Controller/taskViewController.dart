import 'package:fluttertask/Features/home/model/tasksModel.dart';

abstract class TaskViewController {
  bool updateTaskData(Tasks task);
  bool deleteTaskData(String id);
}
