import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  final fakeFirebaseFirestore = FakeFirebaseFirestore();
  group('FetchUserListServiceTest -', () {
    setUp(() => registerServices());

    test(
        "must return an instance of QuerySnapshot on successful fetching from database",
        () async {
      final snapshot = await fakeFirebaseFirestore.collection("users").get();
      expect(snapshot, isA<QuerySnapshot>());
    });

    tearDown(() => locator.reset());
  });
}
