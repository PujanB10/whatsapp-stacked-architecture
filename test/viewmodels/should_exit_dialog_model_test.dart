import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ShouldExitDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
