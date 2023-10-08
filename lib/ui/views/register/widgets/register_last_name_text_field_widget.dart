import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

/// A widget for capturing the user's last name during registration.
class RegisterLastNameTextFieldWidget extends StatelessWidget {
  /// Reference to the view model for data control.
  final RegisterViewModel viewModel;

  /// Creates a [RegisterLastNameTextFieldWidget] to capture user's last name.
  const RegisterLastNameTextFieldWidget({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Returns a text field with a person icon and set width.
    return TextFieldWidget(
      textEditingController: viewModel.lastNameController,
      width: 0.39.sw,
      hintText: "Last Name",
      prefixIcon: const Icon(Icons.person_outline),
    );
  }
}
