import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/login_viewmodel.dart';

class LoginPasswordTextFieldWidget extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginPasswordTextFieldWidget({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      isObscure: true,
      textEditingController: viewModel.passwordController,
      width: 0.78.sw,
      hintText: "Password",
      prefixIcon: const Icon(Icons.lock_outline),
    );
  }
}
