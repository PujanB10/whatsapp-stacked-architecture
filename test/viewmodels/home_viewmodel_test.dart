import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/home_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/home_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/widgets/home_view_app_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/widgets/user_list_view_widget.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('HomeView Widget Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    Widget makeTestableWidget(
        {required Widget child, required int initialIndex}) {
      return ScreenUtilInit(
        ensureScreenSize: true,
        child: MaterialApp(
          home: DefaultTabController(
              length: 4, initialIndex: initialIndex, child: child),
        ),
      );
    }

    testWidgets('HomeView has a title named WhatsApp',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          child: const HomeViewAppBarWidget(), initialIndex: 0));
      await tester.pump();
      final titleFinder = find.text('WhatsApp');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets("description", (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(child: const HomeView(), initialIndex: 1),
      );
      await tester.pump();

      final userListViewFinder = find.byType(UsersListViewWidget);
      expect(userListViewFinder, findsOneWidget);
    });

    testWidgets("HomeView has a New Message Button Widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          makeTestableWidget(initialIndex: 0, child: const HomeView()));
      await tester.pump();
      final newMessageButtonFinder = find.byKey(const Key("newMessageButton"));
      expect(newMessageButtonFinder, findsOneWidget);
    });

    testWidgets("UserListViewWidget has a StreamBuilder Widget",
        (WidgetTester tester) async {
      final HomeViewModel homeViewModel = HomeViewModel();
      await tester.pumpWidget(makeTestableWidget(
          initialIndex: 1,
          child: UsersListViewWidget(homeViewModel: homeViewModel)));
      await tester.pump();
      for (var widget in tester.allWidgets) {
        debugPrint(widget.toString());
      }

      final streamBuilderFinder = find.byType(StreamBuilder<List<Users>>);
      expect(streamBuilderFinder, findsOneWidget);
    });
  });
}
