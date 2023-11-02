import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/page_title_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_email_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_password_text_field_widget.dart';

import '../helpers/test_helpers.dart';

void main() {
  RegisterViewModel getModel() => RegisterViewModel();
  group('Register Widget Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    Widget makeTestableWidget({required Widget childWidget}) {
      return ScreenUtilInit(
          builder: (context, child) => MaterialApp(
                home: childWidget,
              ));
    }

    testWidgets('Register Page contains one PageTitleTextWidget',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const RegisterView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final pageTitleWidgetFinder = find.byType(PageTitleTextWidget);
      expect(pageTitleWidgetFinder, findsOneWidget);
    });

    testWidgets("Register Page contains one RegisterEmailTextFieldWidget",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const RegisterView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final registerEmailTextFieldWidgetFinder =
          find.byType(RegisterEmailTextFieldWidget);
      expect(registerEmailTextFieldWidgetFinder, findsOneWidget);
    });
    testWidgets("Register Page contains one RegisterPasswordTextFieldWidget",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const RegisterView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final registerPasswordTextFieldWidgetFinder =
          find.byType(RegisterPasswordTextFieldWidget);
      expect(registerPasswordTextFieldWidgetFinder, findsOneWidget);
    });
    testWidgets("Register Page contains one Sign In button",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const RegisterView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final signInButtonFinder = find.byKey(const Key("signInButton"));
      expect(signInButtonFinder, findsOneWidget);
    });
    testWidgets("Register Page contains a Sign Up button",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const RegisterView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final signUpButtonFinder = find.byKey(const Key("signUpButton"));
      expect(signUpButtonFinder, findsOneWidget);
    });
  });
}
