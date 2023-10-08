import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/login_viewmodel.dart';

/// A widget for capturing the user's email during login.
class LoginEmailTextFieldWidget extends StatelessWidget {
  /// Reference to the view model for data control.
  final LoginViewModel viewModel;

  /// Creates a [LoginEmailTextFieldWidget] to capture user's email.
  const LoginEmailTextFieldWidget({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Returns a text field with an email icon and set width.
    return TextFieldWidget(
      textEditingController: viewModel.emailController,
      width: 0.78.sw,
      hintText: "Email",
      prefixIcon: const Icon(Icons.email_outlined),
    );
  }
}
