import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CreateTaskController {
  Future<bool> createTask(
      String name, String description, String project, String assignee);
}
