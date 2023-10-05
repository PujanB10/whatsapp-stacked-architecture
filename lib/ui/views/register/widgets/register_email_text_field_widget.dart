import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

class RegisterEmailTextFieldWidget extends StatelessWidget {
  final RegisterViewModel viewModel;
  const RegisterEmailTextFieldWidget({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      textEditingController: viewModel.emailController,
      width: 0.78.sw,
      hintText: "Email",
      prefixIcon: const Icon(Icons.person_2_outlined),
    );
  }
}