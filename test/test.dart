import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:test/test.dart';

void main() {
  group('FirestoreService test cases', () {
    FakeFirebaseFirestore? fakeFirebaseFirestore;
    const Map<String, dynamic> data = {
      "name": "Tasks 1",
      "project": "Project Name",
      "description": "Description",
      "status": "To Do",
      "id": "67777",
      "timeInHour": 0,
      "timeInMin": 0,
      "timeInSec": 0,
      "completeAt": 0,
      "assignee": "Umais Qureshi",
      "isComplete": false,
      "createdAt": 12345676666
    };

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
    });

    group(
      'Tasks',
      () {
        test('Get All List Data', () async {
          const String collectionPath = 'Tasks';

          final CollectionReference<Map<String, dynamic>> collectionReference =
              fakeFirebaseFirestore!.collection(collectionPath);
          await collectionReference.add(data);

          final Stream<QuerySnapshot<Map<String, dynamic>>>
              expectedSnapshotStream = collectionReference.snapshots();

          final actualSnapshotStream =
              fakeFirebaseFirestore!.collection(collectionPath).snapshots();

          final QuerySnapshot<Map<String, dynamic>> expectedQuerySnapshot =
              await expectedSnapshotStream.first;
          final QuerySnapshot<Map<String, dynamic>> actualQuerySnapshot =
              await actualSnapshotStream.first;

          final List<Map<String, dynamic>> expectedDataList =
              expectedQuerySnapshot.docs.map((e) => e.data()).toList();
          final List<Map<String, dynamic>> actualDataList =
              actualQuerySnapshot.docs.map((e) => e.data()).toList();

          expect(actualDataList, expectedDataList);
        });

        test('Get Empty List Data', () async {
          const String collectionPath = 'Tasks';

          final CollectionReference<Map<String, dynamic>> collectionReference =
              fakeFirebaseFirestore!.collection(collectionPath);
          final Stream<QuerySnapshot<Map<String, dynamic>>>
              expectedSnapshotStream = collectionReference.snapshots();

          final QuerySnapshot<Map<String, dynamic>> expectedQuerySnapshot =
              await expectedSnapshotStream.first;

          final List<Map<String, dynamic>> expectedDataList =
              expectedQuerySnapshot.docs.map((e) => e.data()).toList();

          expect([], expectedDataList);
        });

        test('Delete Task from Collection', () async {
          const String collectionPath = 'Tasks';

          final CollectionReference<Map<String, dynamic>> collectionReference =
              fakeFirebaseFirestore!.collection(collectionPath);

          final DocumentReference<Map<String, dynamic>> documentReference =
              await collectionReference.add(data);

          final String documentPath = documentReference.path;

          await fakeFirebaseFirestore!
              .collection(collectionPath)
              .doc(documentPath)
              .delete();

          final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              await collectionReference.doc(documentPath).get();

          expect(documentSnapshot.exists, false);
        });

        test('Update task', () async {
          const String collectionPath = 'Tasks';
          const String documentPath = 'documentPath';

          final DocumentReference<Map<String, dynamic>> documentReference =
              fakeFirebaseFirestore!
                  .collection(collectionPath)
                  .doc(documentPath);

          await documentReference.set(data);

          const Map<String, dynamic> dataUpdate = data;

          await fakeFirebaseFirestore!
              .collection(collectionPath)
              .doc(documentPath)
              .update(data);

          final DocumentSnapshot<Map<String, dynamic>> actualDocumentSnapshot =
              await documentReference.get();

          final Map<String, dynamic>? actualData =
              actualDocumentSnapshot.data();

          const Map<String, dynamic> expectedData = dataUpdate;

          expect(actualData, expectedData);
        });
      },
    );
  });
}
