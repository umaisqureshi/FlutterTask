// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:appflowy_board/appflowy_board.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllTasksModel {
  List<Tasks> todo;
  List<Tasks> inProgress;
  List<Tasks> complete;
  AllTasksModel({
    required this.todo,
    required this.inProgress,
    required this.complete,
  });
}

class Tasks extends AppFlowyGroupItem {
  String name;
  String description;
  String sid;
  String status;
  String project;
  int time;
  bool isCompleted;
  String assignee;
  int completeAt;
  int createdAt;
  Tasks(
      {required this.name,
      required this.description,
      required this.sid,
      required this.time,
      required this.assignee,
      required this.project,
      required this.isCompleted,
      required this.status,
      required this.createdAt,
      required this.completeAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'id': sid,
      'status': status,
      'project': project,
      'assignee': assignee,
      'createdAt': createdAt,
      'time': time,
      'isComplete': isCompleted,
      'completeAt': completeAt
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      name: map['name'] as String,
      project: map['project'] as String,
      description: map['description'] as String,
      sid: map['id'] as String,
      status: map['status'] as String,
      assignee: map['assignee'] as String,
      completeAt: map['completeAt'] as int,
      createdAt: map['createdAt'] as int,
      time: map['time'] as int,
      isCompleted: map['isComplete'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tasks.fromJson(String source) =>
      Tasks.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String get id => sid;
}

class TimerModel {
  int sec;
  String id;
  TimerModel({
    required this.sec,
    required this.id,
  });
}

class UpdateStatus {
  String id;
  String status;
  bool isComplete;
  UpdateStatus(
      {required this.status, required this.id, required this.isComplete});
}
