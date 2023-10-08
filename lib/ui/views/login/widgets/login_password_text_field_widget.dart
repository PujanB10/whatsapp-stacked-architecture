import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/login_viewmodel.dart';

/// A widget for capturing the user's password during login.
class LoginPasswordTextFieldWidget extends StatelessWidget {
  /// Reference to the view model for data control.
  final LoginViewModel viewModel;

  /// Creates a [LoginPasswordTextFieldWidget] to capture user's password.
  const LoginPasswordTextFieldWidget({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Returns an obscured text field with a lock icon and set width.
    return TextFieldWidget(
      isObscure: true,
      textEditingController: viewModel.passwordController,
      width: 0.78.sw,
      hintText: "Password",
      prefixIcon: const Icon(Icons.lock_outline),
    );
  }
}
