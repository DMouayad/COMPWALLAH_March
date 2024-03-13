import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
//
import 'package:weather_siren/ui/utils/context_extensions.dart';
import 'package:weather_siren/ui/widgets/buttons/adaptive_filled_button.dart';
import 'package:weather_siren/ui/widgets/spacing_widgets.dart';

const double _graphicSize = 60;

class SuccessDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SuccessDialog(
      {super.key, required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: context.platformBorderRadius),
      child: Container(
        width: context.dialogWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.title ?? 'Success',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (request.description != null) ...[
                        vSpacerMedium,
                        Text(request.description!, maxLines: 3, softWrap: true),
                      ],
                    ],
                  ),
                ),
                Container(
                  width: _graphicSize,
                  height: _graphicSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(_graphicSize / 2)),
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: context.colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            vSpacerLarge,
            AdaptiveFilledButton(
              height: 44,
              fillWidth: true,
              onPressed: () => completer(DialogResponse(confirmed: true)),
              label: context.localizations.ok,
            ),
          ],
        ),
      ),
    );
  }
}
