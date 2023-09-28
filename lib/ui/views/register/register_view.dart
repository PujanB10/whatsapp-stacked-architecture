import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: GoogleFonts.acme(fontSize: 45),
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: viewModel.firstNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(Icons.abc),
                          hintText: "First Name"),
                    ),
                  ),
                  horizontalSpaceTiny,
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: viewModel.lastNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(Icons.abc),
                          hintText: "Last Name"),
                    ),
                  ),
                ],
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
              verticalSpaceMedium,
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  controller: viewModel.confirmPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Confirm Password"),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: MediaQuery.of(context).viewPadding,
                child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Sign Up"))),
              ),
              verticalSpaceMedium,

              Text("Already a user?"),

              TextButton(onPressed: () {}, child: Text("Sign In"))
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
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
