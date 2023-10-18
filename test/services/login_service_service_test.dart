import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() async {
  final auth = MockFirebaseAuth();
  group('LoginServiceServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test("must return an instance of UserCredential on successful API call",
        () async {
      final result = await auth.signInWithEmailAndPassword(
          email: "bob@somedomain.com", password: "password");
      expect(result, isA<UserCredential>());
    });
  });

  test("must return FirebaseAuthException on error logging in", () async {
    whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
        .on(auth)
        .thenThrow(FirebaseAuthException(code: 'wrong-email'));
    expect(
        () => auth.signInWithEmailAndPassword(email: "agag", password: "Agdgd"),
        throwsA(FirebaseAuthException(code: "wrong-email")));
  });
}
