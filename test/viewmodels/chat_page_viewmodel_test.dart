import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import '../helpers/test_helpers.dart';

class MockFirebase extends Mock implements Firebase {}

void main() {
  group('ChatPageViewModel Tests -', () {
    setUp(() {
      registerServices();
    });
    tearDown(() => locator.reset());

    test("Must return chat id separated by hyphen in alphabetical order", () {
      ChatPageViewModel model = ChatPageViewModel();
      String chatId =
          model.getChatId("jk3jj4b3b4jh3b4", "3jk432kj4nj3k4buy34b");
      expect(chatId, "jk3jj4b3b4jh3b4-3jk432kj4nj3k4buy34b");
    });
  });
}
