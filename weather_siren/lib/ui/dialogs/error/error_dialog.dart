import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_siren/ui/utils/context_extensions.dart';
import 'package:weather_siren/ui/widgets/buttons/adaptive_filled_button.dart';
import 'package:weather_siren/ui/widgets/spacing_widgets.dart';
import 'package:stacked_services/stacked_services.dart';

const double _graphicSize = 28;

class ErrorDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ErrorDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: context.platformBorderRadius),
      child: Container(
        height: max(260, context.screenHeight * .34),
        width: context.dialogWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: _graphicSize,
                  height: _graphicSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorScheme.error,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(_graphicSize / 2)),
                  ),
                  child: Icon(Icons.error, color: context.colorScheme.onError),
                ),
                hSpacerSmall,
                Text(
                  request.title ?? context.localizations.anErrorOccurred,
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            if (request.description != null) ...[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  request.description!,
                  softWrap: true,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
            AdaptiveFilledButton(
              label: context.localizations.ok,
              height: 40,
              fillWidth: true,
              onPressed: () => completer(DialogResponse(confirmed: true)),
            ),
          ],
        ),
      ),
    );
  }
}
