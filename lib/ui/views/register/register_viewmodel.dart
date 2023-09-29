import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:whatsapp_stacked_architecture/services/create_new_user_service.dart';

final _createNewUserService = locator<CreateNewUserService>();
final _navigationService = locator<NavigationService>();

class RegisterViewModel extends BaseViewModel {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  get firstNameController => _firstNameController;
  get lastNameController => _lastNameController;
  get emailController => _emailController;
  get passwordController => _passwordController;
  get confirmPasswordController => _confirmPasswordController;

  /// Async function that calls [createNewUser] service from the
  /// service class
  void createNewUser() async {
    var res = await _createNewUserService.createNewUser(
        emailController.text, passwordController.text);
    if (res.isNotEmpty) {
      /// If the service returns not empty string then
      /// it Sign ups the user and navigates to Home View.
      _navigationService.replaceWithHomeView();
    }
  }

  /// Function that checks if the confirm password field is same as
  /// the password field
  void isConfirmPasswordSame() {
    if (_passwordController.text != _confirmPasswordController) {}
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
