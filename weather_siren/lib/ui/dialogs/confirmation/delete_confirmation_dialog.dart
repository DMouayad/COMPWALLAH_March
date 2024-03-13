import 'package:flutter/material.dart';
import 'package:weather_siren/ui/utils/context_extensions.dart';
import 'package:stacked_services/stacked_services.dart';

import 'confirmation_dialog.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog(
      {super.key, required this.request, required this.completer});

  final DialogRequest request;
  final Function(DialogResponse) completer;

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      request: request,
      completer: completer,
      confirmText: context.localizations.delete,
      confirmButtonStyle: (
        context.colorScheme.errorContainer,
        context.colorScheme.onErrorContainer
      ),
    );
  }
}
