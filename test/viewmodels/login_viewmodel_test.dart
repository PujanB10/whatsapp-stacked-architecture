import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/page_title_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/login_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/login_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/widgets/login_email_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/widgets/login_password_text_field_widget.dart';

import '../helpers/test_helpers.dart';

void main() {
  LoginViewModel getModel() => LoginViewModel();
  group('Login Widget Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    Widget makeTestableWidget({required Widget childWidget}) {
      return ScreenUtilInit(
          builder: (context, child) => MaterialApp(
                home: childWidget,
              ));
    }

    testWidgets('Login Page contains one PageTitleTextWidget',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const LoginView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final pageTitleWidgetFinder = find.byType(PageTitleTextWidget);
      expect(pageTitleWidgetFinder, findsOneWidget);
    });

    testWidgets("Login Page contains one LoginEmailTextFieldWidget",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const LoginView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final logInEmailTextFieldWidgetFinder =
          find.byType(LoginEmailTextFieldWidget);
      expect(logInEmailTextFieldWidgetFinder, findsOneWidget);
    });
    testWidgets("Login Page contains one LoginPasswordTextFieldWidget",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const LoginView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final logInPasswordTextFieldWidgetFinder =
          find.byType(LoginPasswordTextFieldWidget);
      expect(logInPasswordTextFieldWidgetFinder, findsOneWidget);
    });
    testWidgets("Login Page contains one Forgot Password Button",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const LoginView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final forgotPasswordButtonFinder =
          find.byKey(const Key("forgotPasswordButton"));
      expect(forgotPasswordButtonFinder, findsOneWidget);
    });
    testWidgets("Login PAge contains one Log In button",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(makeTestableWidget(childWidget: const LoginView()));
      await tester.pumpAndSettle();
      // Print the widget tree
      final logInButtonFinder = find.byKey(const Key("logInButton"));
      expect(logInButtonFinder, findsOneWidget);
    });
  });
}
