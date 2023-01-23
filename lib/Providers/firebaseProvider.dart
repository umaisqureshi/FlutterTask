import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseInstanceProvider = Provider((ref) {
  return FirebaseProviders();
});

class FirebaseProviders {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
