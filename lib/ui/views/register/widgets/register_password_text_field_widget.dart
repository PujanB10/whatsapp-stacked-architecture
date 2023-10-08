import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

/// A widget for capturing the user's password during registration.
class RegisterPasswordTextFieldWidget extends StatelessWidget {
  /// Reference to the view model for data control.
  final RegisterViewModel viewModel;

  /// Creates a [RegisterPasswordTextFieldWidget] to capture user's password.
  const RegisterPasswordTextFieldWidget({
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
