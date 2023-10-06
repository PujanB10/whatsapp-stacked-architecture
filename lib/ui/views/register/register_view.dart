import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/body_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/custom_text_button_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/page_title_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_confirm_password_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_email_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_first_name_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_last_name_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_password_text_field_widget.dart';

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
              const PageTitleTextWidget(
                text: "Sign Up",
              ),
              verticalSpace(0.03.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RegisterFirstNameTextFieldWidget(viewModel: viewModel),
                  horizontalSpaceTiny,
                  RegisterLastNameTextFieldWidget(viewModel: viewModel)
                ],
              ),
              verticalSpace(0.03.sh),
              RegisterEmailTextFieldWidget(viewModel: viewModel),
              verticalSpace(0.03.sh),
              RegisterPasswordTextFieldWidget(viewModel: viewModel),
              verticalSpace(0.03.sh),
              RegisterConfirmPasswordTextFieldWidget(viewModel: viewModel),
              verticalSpace(0.03.sh),
              CustomTextButtonWidget(
                textInButton: "Sign Up",
                onPressed: () async {
                  await viewModel.createNewUser();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: viewModel.responseSnackbarColor,
                        content: Center(
                          child: BodyTextWidget(
                              text: viewModel.signUpResponseMessage),
                        ),
                      ),
                    );
                  }
                },
              ),
              verticalSpace(0.03.sh),
              const BodyTextWidget(text: "Already a user?"),
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
