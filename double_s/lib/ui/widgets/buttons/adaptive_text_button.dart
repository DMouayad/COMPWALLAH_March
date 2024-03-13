import 'package:flutter/material.dart';
import 'package:double_s/ui/utils/context_extensions.dart';
import 'package:double_s/ui/widgets/optional_parent_widget.dart';

class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.tooltip,
    this.backgroundColor,
    this.labelColor,
    this.height = 44.0,
    this.width = 100.0,
    this.iconData,
    this.iconSize,
  });
  final String label;
  final String? tooltip;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? labelColor;
  final double height;
  final double width;
  final IconData? iconData;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      foregroundColor: MaterialStateProperty.all(
        labelColor ?? (context.colorScheme.onBackground),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: context.platformBorderRadius),
      ),
    );
    return OptionalParentWidget(
      condition: tooltip != null,
      parentWidgetBuilder: (child) => Tooltip(message: tooltip, child: child),
      childWidget: iconData != null
          ? TextButton.icon(
              onPressed: onPressed,
              icon: Icon(iconData, size: iconSize),
              label: Text(label),
              style: buttonStyle,
            )
          : TextButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: Text(label),
            ),
    );
  }
}
