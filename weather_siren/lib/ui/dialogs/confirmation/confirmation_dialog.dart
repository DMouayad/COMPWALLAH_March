import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
//
import 'package:weather_siren/ui/utils/context_extensions.dart';
import 'package:weather_siren/ui/widgets/buttons/adaptive_filled_button.dart';
import 'package:weather_siren/ui/widgets/spacing_widgets.dart';

class ConfirmationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  final String? confirmText;
  final (Color backgroundColor, Color labelColor)? confirmButtonStyle;

  const ConfirmationDialog({
    super.key,
    required this.request,
    required this.completer,
    this.confirmText,
    this.confirmButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: context.platformBorderRadius),
      child: Container(
        width: context.dialogWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSpacerSmall,
            Text(
              request.title ??
                  context.localizations.defaultConfirmationDialogTitle,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (request.description != null) ...[
              vSpacerLarge,
              Text(
                request.description!,
                softWrap: true,
                style: context.textTheme.bodyLarge,
              ),
            ],
            vSpacerLarge,
            ButtonBar(
              children: [
                AdaptiveFilledButton(
                  height: 44,
                  width: 100,
                  onPressed: () => completer(DialogResponse(confirmed: true)),
                  label: confirmText ?? context.localizations.ok,
                  labelColor: confirmButtonStyle?.$2,
                  backgroundColor: confirmButtonStyle?.$1,
                ),
                AdaptiveFilledButton(
                  height: 44,
                  width: 100,
                  backgroundColor: context.colorScheme.secondaryContainer,
                  labelColor: context.colorScheme.onSecondaryContainer,
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                  label: context.localizations.cancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
