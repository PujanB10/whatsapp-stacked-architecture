import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/custom_text_button_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_field_widget.dart';
import 'login_viewmodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        return viewModel.isSupposedToExit();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Log In",
                  style: GoogleFonts.acme(fontSize: 50.sp),
                ),
                verticalSpace(0.03.sh),
                TextFieldWidget(
                  textEditingController: viewModel.emailController,
                  width: 0.78.sw,
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.person_2_outlined),
                ),
                verticalSpace(0.03.sh),
                TextFieldWidget(
                  isObscure: true,
                  textEditingController: viewModel.passwordController,
                  width: 0.78.sw,
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                TextButton(
                    onPressed: () {}, child: const Text("Forgot password?")),
                verticalSpace(0.01.sh),
                CustomTextButtonWidget(
                  onPressed: () async {
                    await viewModel.logIn();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              viewModel.snackBarColorOnAuthentication,
                          content: Text(viewModel.logInResponseMessage)));
                    }
                  },
                  textInButton: "Log In",
                ),
                verticalSpace(0.03.sh),
                const Text("Or Sign Up Using"),
                verticalSpace(0.01.sh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.google)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.facebook)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.instagram))
                  ],
                ),
                verticalSpace(0.01.sh),
                const Text("or"),
                TextButton(
                    onPressed: () {
                      viewModel.navigateToRegisterView();
                    },
                    child: const Text("Sign Up")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
