import 'package:flutter/material.dart';
import 'package:weather_siren/ui/utils/context_extensions.dart';
//

class AdaptiveSwitchTile extends StatelessWidget {
  const AdaptiveSwitchTile({
    required this.value,
    required this.label,
    required this.onChanged,
    required this.icon,
    required this.description,
    Key? key,
  }) : super(key: key);

  final bool value;
  final Widget icon;
  final void Function(bool value) onChanged;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return defaultBuilder(context);
  }

  Widget defaultBuilder(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      title: Text(
        description,
        style: context.textTheme.titleMedium,
      ),
      secondary: icon,
      subtitle: Text(
        value ? context.localizations.enabled : context.localizations.disabled,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      activeColor: context.colorScheme.primary,
      onChanged: onChanged,
    );
  }
}
