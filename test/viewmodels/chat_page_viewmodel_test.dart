import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/bottom_nav_bar_floating_button.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/bottom_nav_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/chat_page_app_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/message_list_view_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/app_bar_title_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/message_text_field_widget.dart';
import '../helpers/test_helpers.dart';

void main() {
  viewModel() => ChatPageViewModel();
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseCoreMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group("ChatPage Widget Tests", () {
    setUp(() {
      registerServices();
    });
    tearDown(() => locator.reset());
    Widget makeTestableWidget({required Widget child}) {
      return ScreenUtilInit(
        ensureScreenSize: true,
        child: MaterialApp(
          home: child,
        ),
      );
    }

    testWidgets("Chat Page has a ChatPageAppBarWidget",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: const ChatPageView(
              username: "username",
              imageUrl: "assets/images/icon2.png",
              receiverUserId: "receiverUserId")));
      await tester.pump();

      final chatPageAppBarWidgetFinder = find.byType(ChatPageAppBarWidget);
      expect(chatPageAppBarWidgetFinder, findsOneWidget);
    });

    testWidgets("Chat Page has a MessageListViewWidget",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: const ChatPageView(
              username: "username",
              imageUrl: "assets/images/icon2.png",
              receiverUserId: "receiverUserId")));
      await tester.pump();

      final messageListViewWidgetFinder = find.byType(MesssageListViewWidget);
      expect(messageListViewWidgetFinder, findsOneWidget);
    });

    testWidgets("Chat Page has a BottomNavBar Widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: const ChatPageView(
              username: "username",
              imageUrl: "assets/images/icon2.png",
              receiverUserId: "receiverUserId")));
      await tester.pump();

      final bottomNavBarFinder = find.byType(BottomNavBar);
      expect(bottomNavBarFinder, findsOneWidget);
    });

    testWidgets(
        "Chat Page App Bar has a Circle Avatar that contains image of the user",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: ChatPageAppBarWidget(
              username: "username",
              imageUrl: "assets/images/icon2.png",
              viewModel: viewModel())));
      await tester.pump();

      final circleAvatarWidgetFinder = find.byType(CircleAvatar);
      expect(circleAvatarWidgetFinder, findsOneWidget);
    });
    testWidgets("Chat Page App Bar has a AppBarTitleTextWidget",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: ChatPageAppBarWidget(
              username: "username",
              imageUrl: "assets/images/icon2.png",
              viewModel: viewModel())));
      await tester.pump();

      final appBarTitleTextWidgetFinder = find.byType(AppBarTitleTextWidget);
      expect(appBarTitleTextWidgetFinder, findsOneWidget);
    });

    testWidgets("Chat Page App Bar has 4 Icon Buttons",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: ChatPageAppBarWidget(
              username: "username",
              imageUrl: "assets/images/icon2.png",
              viewModel: viewModel())));
      await tester.pump();

      final iconButtonsFinder = find.byType(IconButton);
      expect(iconButtonsFinder, findsNWidgets(4));
    });

    testWidgets("MessageListViewWidget has a StreamBuilder Widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: MesssageListViewWidget(
        receiverUserId: "aggewt4ga",
        chatPageViewModel: viewModel(),
      )));
      await tester.pump();

      final streamBuilderFinder = find.byType(StreamBuilder<List<ChatModel>>);
      expect(streamBuilderFinder, findsOneWidget);
    });

    testWidgets("BottomNavBar Widget has a MessageTextFieldWidget",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: Scaffold(
        body: ChangeNotifierProvider.value(
          value: ChatPageViewModel(),
          child: BottomNavBar(
            userName: "UserName",
            viewModel: viewModel(),
          ),
        ),
      )));
      await tester.pump();

      final messageTextFieldWidgetFinder = find.byType(MessageTextFieldWidget);
      expect(messageTextFieldWidgetFinder, findsOneWidget);
    });

    testWidgets("BottomNavBar Widget has a BottomNavBarFloatingButton Widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: Scaffold(
        body: ChangeNotifierProvider.value(
          value: ChatPageViewModel(),
          child: BottomNavBar(
            userName: "UserName",
            viewModel: viewModel(),
          ),
        ),
      )));
      await tester.pump();

      final bottomNavBatFloatingButtonFinder =
          find.byType(BottomNavBarFloatingButton);
      expect(bottomNavBatFloatingButtonFinder, findsOneWidget);
    });
  });
}
