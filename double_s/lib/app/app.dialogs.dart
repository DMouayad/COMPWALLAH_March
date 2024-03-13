// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/confirmation/confirmation_dialog.dart';
import '../ui/dialogs/confirmation/delete_confirmation_dialog.dart';
import '../ui/dialogs/error/error_dialog.dart';
import '../ui/dialogs/success/success_dialog.dart';

enum DialogType {
  error,
  confirmation,
  deleteConfirmation,
  success,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.error: (context, request, completer) =>
        ErrorDialog(request: request, completer: completer),
    DialogType.confirmation: (context, request, completer) =>
        ConfirmationDialog(request: request, completer: completer),
    DialogType.deleteConfirmation: (context, request, completer) =>
        DeleteConfirmationDialog(request: request, completer: completer),
    DialogType.success: (context, request, completer) =>
        SuccessDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
