import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:whatsapp_stacked_architecture/services/login_service_service.dart';

class LoginViewModel extends BaseViewModel {
  /// Initializing services used in the Login page.
  final _logInService = locator<LoginServiceService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  String _logInResponseMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color _snackBarColorOnAuthentication = Colors.red;

  /// Get methods to access the private variables.
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String get logInResponseMessage => _logInResponseMessage;
  Color get snackBarColorOnAuthentication => _snackBarColorOnAuthentication;

  /// Async function that calls [logIn] service from the
  /// service class
  Future<void> logIn() async {
    final String response = await _logInService.logIn(
        emailController.text, passwordController.text);
    debugPrint("response ========> $response");

    /// If the email given by user is not valid, returns the given
    /// message to the snackbar.
    if (response == "invalid-email") {
      _logInResponseMessage = "The email you have entered is not valid.";
    }

    /// If the credentials given by user is not valid, returns
    /// the given message to the snackbar.
    else if (response == "INVALID_LOGIN_CREDENTIALS") {
      _logInResponseMessage =
          "The email or password you've entered is incorrect.";

      /// If the credentials given by user is valid and on completion
      /// of signing in returns the given message and navigates to
      ///  Home Page
    } else if (response == "Successful") {
      _logInResponseMessage = "You have been loggen in.";
      _snackBarColorOnAuthentication = Colors.lightGreen;
      debugPrint(_logInResponseMessage);
      _navigationService.replaceWithHomeView();
    }
  }

  /// Method that navigates to Register Page
  void navigateToRegisterView() {
    _navigationService.navigateToRegisterView();
  }

  /// Method that shows an exit dialog through Stacked service
  /// and return boolean value according to user's input.
  ///
  /// Returns ``` true ``` if confirmed to exit.
  ///
  /// Returns ``` false ``` if denied to exit.
  Future<bool> isSupposedToExit() async {
    final res = await _dialogService.showConfirmationDialog(
        title: "Do you want to exit?");
    return res == null ? false : res.confirmed;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
