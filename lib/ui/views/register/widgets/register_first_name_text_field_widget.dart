import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

/// A widget for capturing the user's first name during registration.
class RegisterFirstNameTextFieldWidget extends StatelessWidget {
  /// Reference to the view model for data control.
  final RegisterViewModel viewModel;

  /// Creates a [RegisterFirstNameTextFieldWidget] to capture user's first name.
  const RegisterFirstNameTextFieldWidget({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Returns a text field with a person icon and set width.
    return TextFieldWidget(
      textEditingController: viewModel.firstNameController,
      width: 0.39.sw,
      hintText: "First Name",
      prefixIcon: const Icon(Icons.person_outline),
    );
  }
}
