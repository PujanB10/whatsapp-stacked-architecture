import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

/// A widget for capturing the user's email during registration.
class RegisterEmailTextFieldWidget extends StatelessWidget {
  /// Reference to the view model for data control.
  final RegisterViewModel viewModel;

  /// Creates a [RegisterEmailTextFieldWidget] to capture user's email.
  const RegisterEmailTextFieldWidget({
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
