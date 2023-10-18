import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:whatsapp_stacked_architecture/services/login_service_service.dart';

class LoginViewModel extends BaseViewModel {
  /// Initializing services used in the Login page.
  final _requestLoginApiService = locator<LoginServiceService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  String _requestLoginApiResponseMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color _snackBarColorOnAuthentication = Colors.red;

  /// Get methods to access the private variables.
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String get requestLoginApiResponseMessage => _requestLoginApiResponseMessage;
  Color get snackBarColorOnAuthentication => _snackBarColorOnAuthentication;

  /// Calls [requestLoginApi] service from the service class
  Future<void> requestLoginApi() async {
    final String response = await _requestLoginApiService.requestLoginApi(
        emailController.text, passwordController.text);
    debugPrint("response ========> $response");

    /// If the email given by user is not valid, returns the given
    /// message to the snackbar.
    if (response == "invalid-email") {
      _requestLoginApiResponseMessage =
          "The email you have entered is not valid.";
    }

    /// If the credentials given by user is not valid, returns
    /// the given message to the snackbar.
    else if (response == "INVALID_LOGIN_CREDENTIALS") {
      _requestLoginApiResponseMessage =
          "The email or password you've entered is incorrect.";

      /// If the credentials given by user is valid and on completion
      /// of signing in returns the given message and navigates to
      ///  Home Page
    } else if (response == "Successful") {
      _requestLoginApiResponseMessage = "You have been loggen in.";
      _snackBarColorOnAuthentication = Colors.lightGreen;
      debugPrint(_requestLoginApiResponseMessage);
      _navigationService.clearStackAndShow(Routes.homeView);

      // If no credentials have been given, show the given message in snackbar.
    } else if (response == "channel-error") {
      _requestLoginApiResponseMessage =
          "Please type in the required credentials";
    }
  }

  /// Method that navigates to Register Page
  void navigateToRegisterView() {
    _navigationService.navigateToRegisterView();
  }

  /// Whether to exit the app or not.
  ///
  /// This method shows an exit dialog through stacked services asking if the
  /// user wants to exit the app or not.
  ///
  /// Returns [true] if confirmed to exit.
  /// Returns [false] if denied to exit.
  Future<bool> isSupposedToExit() async {
    final DialogResponse<dynamic>? response = await _dialogService
        .showConfirmationDialog(title: "Do you want to exit?");
    return response?.confirmed ?? false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
