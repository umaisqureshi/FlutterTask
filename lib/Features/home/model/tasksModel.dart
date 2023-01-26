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
  int timeInHour;
  int timeInMin;
  int timeInSec;
  bool isCompleted;
  String assignee;
  int createdAt;
  Tasks({
    required this.name,
    required this.description,
    required this.sid,
    required this.timeInHour,
    required this.timeInMin,
    required this.assignee,
    required this.timeInSec,
    required this.project,
    required this.isCompleted,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'id': sid,
      'status': status,
      'project': project,
      'assignee': assignee,
      'createdAt': createdAt,
      'timeInHour': timeInHour,
      'timeInSec': timeInSec,
      'timeInMin': timeInMin,
      'isComplete': isCompleted
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
      createdAt: map['createdAt'] as int,
      timeInHour: map['timeInHour'] as int,
      timeInMin: map['timeInMin'] as int,
      timeInSec: map['timeInSec'] as int,
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
  int hour;
  int min;
  int sec;
  String id;
  TimerModel({
    required this.hour,
    required this.min,
    required this.sec,
    required this.id,
  });
}

class UpdateStatus {
  String id;
  String status;
  UpdateStatus({required this.status, required this.id});
}
