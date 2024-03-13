import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_siren/ui/utils/custom_builders.dart';
//
import 'package:weather_siren/ui/utils/context_extensions.dart';

const windowsButtonHeight = 32;

class AdaptiveFilledButton extends StatelessWidget {
  const AdaptiveFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconData,
    this.backgroundColor,
    this.labelColor,
    this.fillHeight = false,
    this.fillWidth = false,
    this.width,
    this.height,
  });

  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool fillHeight;
  final bool fillWidth;
  final double? height;
  final double? width;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return CustomBuilder<Widget>(
      adaptiveBuilder: AdaptiveBuilder(
        fallBackChild: _AndroidFilledButton(
          label: label,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          labelColor: labelColor,
          iconData: iconData,
          height: height ?? (context.isDesktopPlatform ? 38 : 44),
          width: fillWidth ? double.infinity : (width ?? 80),
        ),
        iosChild: CupertinoButton(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          onPressed: onPressed,
          color: context.colorScheme.primary,
          child: Text(
            label,
            style: context.textTheme.titleMedium?.copyWith(
              color: labelColor ?? context.colorScheme.onSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ).of(context);
  }
}

class _AndroidFilledButton extends StatelessWidget {
  const _AndroidFilledButton({
    required this.label,
    required this.onPressed,
    required this.height,
    required this.width,
    this.iconData,
    this.backgroundColor,
    this.labelColor,
  });

  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? labelColor;
  final double height;
  final double width;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          var color = backgroundColor ?? context.colorScheme.primary;
          if (states.contains(MaterialState.hovered)) {
            return Color.lerp(
                context.colorScheme.onBackground.withOpacity(.11), color, .8);
          }
          return color;
        },
      ),
      foregroundColor: MaterialStateProperty.all(
        labelColor ?? (context.colorScheme.onPrimary),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: context.platformBorderRadius),
      ),
    );
    return SizedBox.fromSize(
      size: Size(width, height),
      child: iconData != null
          ? TextButton.icon(
              label: Text(label),
              onPressed: onPressed,
              icon: Icon(iconData, size: 20),
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
