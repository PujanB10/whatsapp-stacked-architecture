import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

class RegisterFirstNameTextFieldWidget extends StatelessWidget {
  final RegisterViewModel viewModel;
  const RegisterFirstNameTextFieldWidget({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      textEditingController: viewModel.firstNameController,
      width: 0.39.sw,
      hintText: "First Name",
      prefixIcon: const Icon(Icons.person_outline),
    );
  }
}
