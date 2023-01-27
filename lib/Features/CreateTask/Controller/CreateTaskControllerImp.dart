import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Providers/provider.dart';
import 'createTaskController.dart';

class CreateTaskControllerImp extends CreateTaskController {
  CreateTaskControllerImp(this.ref);
  final Ref ref;

  @override
  Future<bool> createTask(String name, String description, String project,
      String assignee) async {
    try {
      final fire = ref.read(firebaseInstanceProvider).firestore;
      CollectionReference collectionRef = fire.collection("Tasks");
      collectionRef.add({
        "name": name,
        "project": project,
        "description": description,
        "status": "To Do",
        "id": "67777",
        "time": 0,
        "completeAt": 0,
        "assignee": "Umais Qureshi",
        "isComplete": false,
        "createdAt": DateTime.now().millisecondsSinceEpoch
      }).then((value) {
        collectionRef.doc(value.id).update({"id": value.id});
      });
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
