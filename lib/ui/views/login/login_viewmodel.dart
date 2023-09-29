import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:whatsapp_stacked_architecture/services/login_service_service.dart';

class LoginViewModel extends BaseViewModel {
  final _logInService = locator<LoginServiceService>();
  final _navigationService = locator<NavigationService>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  get emailController => _emailController;
  get passwordController => _passwordController;

  /// Async function that calls [logIn] service from the
  /// service class
  void logIn() async {
    var res = await _logInService.logIn(
        emailController.text, passwordController.text);
    if (res.isNotEmpty) {
      /// If the service returns not empty string then
      /// it Sign ups the user and navigates to Home View.
      _navigationService.navigateToHomeView();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
