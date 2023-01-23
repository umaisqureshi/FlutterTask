// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AllTasksModel {
  List<Tasks> children;
  AllTasksModel({ required this.children});
}

class Tasks {
  String name;
  String description;
  String id;
  String status;
  Timestamp time;
  Tasks({
    required this.name,
    required this.description,
    required this.id,
    required this.status,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'id': id,
      'status': status,
      'time': time,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      name: map['name'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      status: map['status'] as String,
      time: map['time'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tasks.fromJson(String source) =>
      Tasks.fromMap(json.decode(source) as Map<String, dynamic>);
}
