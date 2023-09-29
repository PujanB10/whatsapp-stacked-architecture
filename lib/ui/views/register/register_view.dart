import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/custom_text_button_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpaceMassive,
              Text(
                "Sign Up",
                style: GoogleFonts.acme(fontSize: 45),
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    textEditingController: viewModel.firstNameController,
                    width: 150,
                    hintText: "First Name",
                    prefixIcon: const Icon(Icons.abc_outlined),
                  ),
                  horizontalSpaceTiny,
                  TextFieldWidget(
                    textEditingController: viewModel.lastNameController,
                    width: 150,
                    hintText: "Last Name",
                    prefixIcon: const Icon(Icons.abc_outlined),
                  )
                ],
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                textEditingController: viewModel.emailController,
                width: 300,
                hintText: "Email",
                prefixIcon: const Icon(Icons.person_2_outlined),
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                isObscure: true,
                textEditingController: viewModel.passwordController,
                width: 300,
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock_outline),
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                isObscure: true,
                textEditingController: viewModel.confirmPasswordController,
                width: 300,
                hintText: "Confirm Password",
                prefixIcon: const Icon(Icons.abc_outlined),
              ),
              verticalSpaceMedium,
              CustomTextButtonWidget(
                  textInButton: "Sign Up",
                  onPressed: () {
                    viewModel.createNewUser();
                  }),
              verticalSpaceMedium,
              const Text("Already a user?"),
              TextButton(onPressed: () {}, child: const Text("Sign In"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
