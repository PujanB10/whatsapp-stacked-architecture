import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log In",
                style: GoogleFonts.acme(fontSize: 45),
              ),
              verticalSpaceMedium,
              SizedBox(
                width: 300,
                child: TextField(
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: "Email"),
                ),
              ),
              verticalSpaceMedium,
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  controller: viewModel.passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Password"),
                ),
              ),
              TextButton(onPressed: () {}, child: Text("Forgot password?")),
              verticalSpaceSmall,
              SizedBox(
                  width: 200,
                  height: 50,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Log In"))),
              verticalSpaceMedium,
              Text("Or Sign Up Using"),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.google)),
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.facebook)),
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram))
                ],
              ),

              // SizedBox(
              //     height: 50,
              //     width: 200,
              //     child: ElevatedButton(onPressed: () {}, child: Text("Sign Up"))),
            ],
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
