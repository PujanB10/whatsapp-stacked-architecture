import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';
import 'package:whatsapp_stacked_architecture/services/create_new_user_service.dart';

class RegisterViewModel extends BaseViewModel {
  final _createNewUserService = locator<CreateNewUserService>();
  final _navigationService = locator<NavigationService>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _signUpResponseMessage = "";
  Color _responseSnackbarColor = Colors.red;

  // Get methods to access the private variables.
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  String get signUpResponseMessage => _signUpResponseMessage;
  Color get responseSnackbarColor => _responseSnackbarColor;

  /// Async function that calls service to create a new user.
  Future<void> createNewUser() async {
    // Recives the response given by the service class
    final response = await _createNewUserService.createNewUser(
        email: emailController.text, password: passwordController.text);

    // If the response received contains keyword successful adds the user
    // to the database and navigates to Home Page.
    if (response.contains("successful")) {
      // Converting the given credentials into User model.
      final user = Users(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              email: _emailController.text,

              // The response is in the format of "successful:userId" so retrieving
              // the userId from the response.
              userId: response.split(":")[1])
          .toJson();

      // Add the user to the database.
      await _createNewUserService.addInDatabase(user);
      _signUpResponseMessage = "New user with given user has been created";
      _responseSnackbarColor = Colors.green;
      _navigationService.replaceWithHomeView();
    }

    // If response recives weak-password message show the given message in
    // the snackbar.
    if (response == 'weak-password') {
      debugPrint('The password provided is too weak.');
      _signUpResponseMessage = "The password provided is too weak.";

      // If response recives email-already-in-use message show the given message in
      // the snackbar.
    } else if (response == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
      _signUpResponseMessage = "The account already exists for that email.";

      // If faced any other errors shows the response message in the snackbar.
    } else {
      debugPrint(response);
      _signUpResponseMessage = response;
    }
  }

  /// Function that checks if the confirm password field is same as
  /// the password field
  // void isConfirmPasswordSame() {
  //   if (_passwordController.text != _confirmPasswordController) {}
  // }

  /// Method that navigates to Login Page.
  void navigateToLoginView() {
    _navigationService.replaceWithLoginView();
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
