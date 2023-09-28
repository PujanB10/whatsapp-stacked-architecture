import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  get emailController => _emailController;
  get passwordController => _passwordController;
}
