import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                style: GoogleFonts.acme(fontSize: 50.sp),
              ),
              verticalSpace(0.03.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    textEditingController: viewModel.firstNameController,
                    width: 0.39.sw,
                    hintText: "First Name",
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  horizontalSpaceTiny,
                  TextFieldWidget(
                    textEditingController: viewModel.lastNameController,
                    width: 0.39.sw,
                    hintText: "Last Name",
                    prefixIcon: const Icon(Icons.person_outline),
                  )
                ],
              ),
              verticalSpace(0.03.sh),
              TextFieldWidget(
                textEditingController: viewModel.emailController,
                width: 0.78.sw,
                hintText: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              verticalSpace(0.03.sh),
              TextFieldWidget(
                isObscure: true,
                textEditingController: viewModel.passwordController,
                width: 0.78.sw,
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock_outline),
              ),
              verticalSpace(0.03.sh),
              TextFieldWidget(
                isObscure: true,
                textEditingController: viewModel.confirmPasswordController,
                width: 0.78.sw,
                hintText: "Confirm Password",
                prefixIcon: const Icon(Icons.lock_outline),
              ),
              verticalSpace(0.03.sh),
              CustomTextButtonWidget(
                  textInButton: "Sign Up",
                  onPressed: () async {
                    await viewModel.createNewUser();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Center(
                              child: Text(viewModel.signUpResponseMessage))));
                    }
                  }),
              verticalSpace(0.03.sh),
              const Text("Already a user?"),
              TextButton(
                  onPressed: () {
                    viewModel.navigateToLoginView();
                  },
                  child: const Text("Sign In"))
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
