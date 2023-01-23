// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AllTasksModel {
  List<Tasks> children;
  AllTasksModel({required this.children});
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

class Tasks {
  String name;
  String description;
  String id;
  String status;
  String project;
  int timeInHour;
  int timeInMin;
  int timeInSec;
  bool isCompleted;
  Timestamp time;
  Tasks({
    required this.name,
    required this.description,
    required this.id,
    required this.timeInHour,
    required this.timeInMin,
    required this.timeInSec,
    required this.project,
    required this.isCompleted,
    required this.status,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'id': id,
      'status': status,
      'project': project,
      'createdAt': time,
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
      id: map['id'] as String,
      status: map['status'] as String,
      time: map['createdAt'] as Timestamp,
      timeInHour: map['timeInHour'] as int,
      timeInMin: map['timeInMin'] as int,
      timeInSec: map['timeInSec'] as int,
      isCompleted: map['isComplete'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tasks.fromJson(String source) =>
      Tasks.fromMap(json.decode(source) as Map<String, dynamic>);
}
