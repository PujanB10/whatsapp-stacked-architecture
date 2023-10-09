import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_first_name_text_field_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/widgets/register_last_name_text_field_widget.dart';

/// A widget for displaying the first name and last name text fields in the register view.
class NameLastnameFieldWidgets extends StatelessWidget {
  /// The view model for the register view.
  final RegisterViewModel viewModel;

  /// Creates a [NameLastnameFieldWidgets] widget with the given [viewModel].
  const NameLastnameFieldWidgets({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a row of text fields for the first name and last name.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RegisterFirstNameTextFieldWidget(viewModel: viewModel),
        horizontalSpaceTiny,
        RegisterLastNameTextFieldWidget(viewModel: viewModel)
      ],
    );
  }
}
