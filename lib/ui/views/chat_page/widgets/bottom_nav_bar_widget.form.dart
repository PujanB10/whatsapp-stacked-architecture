// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String MessageInputValueKey = 'messageInput';

final Map<String, TextEditingController> _BottomNavBarTextEditingControllers =
    {};

final Map<String, FocusNode> _BottomNavBarFocusNodes = {};

final Map<String, String? Function(String?)?> _BottomNavBarTextValidations = {
  MessageInputValueKey: null,
};

mixin $BottomNavBar {
  TextEditingController get messageInputController =>
      _getFormTextEditingController(MessageInputValueKey);

  FocusNode get messageInputFocusNode =>
      _getFormFocusNode(MessageInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BottomNavBarTextEditingControllers.containsKey(key)) {
      return _BottomNavBarTextEditingControllers[key]!;
    }

    _BottomNavBarTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BottomNavBarTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BottomNavBarFocusNodes.containsKey(key)) {
      return _BottomNavBarFocusNodes[key]!;
    }
    _BottomNavBarFocusNodes[key] = FocusNode();
    return _BottomNavBarFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    messageInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    messageInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          MessageInputValueKey: messageInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _BottomNavBarTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BottomNavBarFocusNodes.values) {
      focusNode.dispose();
    }

    _BottomNavBarTextEditingControllers.clear();
    _BottomNavBarFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get messageInputValue =>
      this.formValueMap[MessageInputValueKey] as String?;

  set messageInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({MessageInputValueKey: value}),
    );

    if (_BottomNavBarTextEditingControllers.containsKey(MessageInputValueKey)) {
      _BottomNavBarTextEditingControllers[MessageInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasMessageInput =>
      this.formValueMap.containsKey(MessageInputValueKey) &&
      (messageInputValue?.isNotEmpty ?? false);

  bool get hasMessageInputValidationMessage =>
      this.fieldsValidationMessages[MessageInputValueKey]?.isNotEmpty ?? false;

  String? get messageInputValidationMessage =>
      this.fieldsValidationMessages[MessageInputValueKey];
}

extension Methods on FormStateHelper {
  setMessageInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MessageInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    messageInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      MessageInputValueKey: getValidationMessage(MessageInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BottomNavBarTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BottomNavBarTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      MessageInputValueKey: getValidationMessage(MessageInputValueKey),
    });
