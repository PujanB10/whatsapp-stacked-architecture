// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/should_exit/should_exit_dialog.dart';

enum DialogType {
  infoAlert,
  shouldExit,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.shouldExit: (context, request, completer) =>
        ShouldExitDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
