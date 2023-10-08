import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/body_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/elevated_button_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/page_title_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/snackbar_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_button_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_button_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/widgets/login_email_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/widgets/login_password_text_field_widget.dart';
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
              children: <Widget>[
                const PageTitleTextWidget(text: "Log In"),
                verticalSpace(0.03.sh),
                LoginEmailTextFieldWidget(
                  viewModel: viewModel,
                ),
                verticalSpace(0.03.sh),
                LoginPasswordTextFieldWidget(
                  viewModel: viewModel,
                ),
                TextButtonWidget(
                  onPressed: () {},
                  text: "Forgot Password",
                ),
                verticalSpace(0.01.sh),
                ElevatedButtonWidget(
                  onPressed: () async {
                    await viewModel.logIn();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              viewModel.snackBarColorOnAuthentication,
                          content: SnackbarTextWidget(
                              text: viewModel.logInResponseMessage),
                        ),
                      );
                    }
                  },
                  textInButton: "Log In",
                ),
                verticalSpace(0.03.sh),
                const BodyTextWidget(text: "or"),
                TextButtonWidget(
                    onPressed: () {
                      viewModel.navigateToRegisterView();
                    },
                    text: "Sign Up"),
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
