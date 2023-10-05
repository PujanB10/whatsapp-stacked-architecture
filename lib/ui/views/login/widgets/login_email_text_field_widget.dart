import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/login_viewmodel.dart';

class LoginEmailTextFieldWidget extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginEmailTextFieldWidget({
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
