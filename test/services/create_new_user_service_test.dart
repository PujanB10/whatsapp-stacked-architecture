import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import '../helpers/test_helpers.dart';

void main() async {
  group('CreateNewUserServiceTest -', () {
    final auth = MockFirebaseAuth();
    setUp(() {
      registerServices();
    });

    test("must return an instance of UserCredential on successful API call",
        () async {
      final result = await auth.createUserWithEmailAndPassword(
          email: "bob@gmail.com", password: "password");
      expect(result, isA<UserCredential>());
    });

    test("must return FirebaseAuthException when wrong credential is given",
        () async {
      whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
          .on(auth)
          .thenThrow(FirebaseAuthException(code: "invalid-email"));
      expect(
          () => auth.createUserWithEmailAndPassword(
              email: "agag", password: "Agdgd"),
          throwsA(FirebaseAuthException(code: "invalid-email")));
    });
    tearDown(() => locator.reset());
  });
}
