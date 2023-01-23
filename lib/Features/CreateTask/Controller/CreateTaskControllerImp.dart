import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Providers/firebaseProvider.dart';
import 'createTaskController.dart';

final createTaskControllerProvider = Provider((ref) {
  return CreateTaskControllerImp(ref);
});

class CreateTaskControllerImp extends CreateTaskController {
  CreateTaskControllerImp(this.ref);
  final Ref ref;

  @override
  Future<bool> createTask(
      String name, String description, String projectName) async {
    try {
      final fire = ref.read(firebaseInstanceProvider).firestore;
      CollectionReference collectionRef = fire.collection("Tasks");
      collectionRef.add({
        "name": name,
        "project": projectName,
        "description": description,
        "status": "TODO",
        "id": "67777",
        "timeInHour": 0,
        "timeInMin": 0,
        "timeInSec": 0,
        "isComplete": false,
        "createdAt": Timestamp.now()
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
