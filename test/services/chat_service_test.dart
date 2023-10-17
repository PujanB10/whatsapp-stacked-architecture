import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  final fakeFirebaseFirestore = FakeFirebaseFirestore();
  const uid = "abc";
  group('ChatServiceTest -', () {
    setUp(() {
      registerServices();
    });

    test("must return instance of query snapshot on successful fetch API call",
        () async {
      final snapshot = await fakeFirebaseFirestore
          .collection("path")
          .doc("chat-id")
          .collection("collectionPath")
          .get();
      expect(snapshot, isA<QuerySnapshot>());
    });

    test('adds an entry in the database', () async {
      String expectedUserAfterDump = '{\n'
          '  "users": {\n'
          '    "abc": {\n'
          '      "name": "Bob",\n'
          '      "gender": "male"\n'
          '    }\n'
          '  }\n'
          '}';
      final instance = FakeFirebaseFirestore();
      final user = instance.collection('users').doc(uid);
      await user.set({'name': 'Bob', 'gender': "male"});
      expect(instance.dump(), expectedUserAfterDump);
    });

    test(
        "must return an instance of Document reference on successful API call to add entry in database",
        () async {
      final result = await fakeFirebaseFirestore
          .collection("path")
          .doc("chat-id")
          .collection("collectionPath")
          .add({});
      expect(result, isA<DocumentReference>());
    });

    test("must return Exception on unsuccessful API call", () async {
      whenCalling(Invocation.method(#add, null))
          .on(fakeFirebaseFirestore)
          .thenThrow(Exception("Error adding data"));

      expect(
          () => fakeFirebaseFirestore
              .collection("path")
              .doc("chat-id")
              .collection("collectionPath")
              .add({}),
          throwsA(Exception("Error adding data")));
    });
    tearDown(() => locator.reset());
  });
}
