import 'package:flutter/material.dart';
import 'package:double_s/ui/utils/context_extensions.dart';
import 'package:double_s/ui/widgets/spacing_widgets.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<CustomDropdownMenuItem<T>> items;
  final String tooltipMessage;
  final void Function(T value) onChanged;
  final T selectedValue;
  final Size? size;
  final TextStyle? selectedTextStyle;
  final Color? foregroundColor;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.selectedValue,
    required this.tooltipMessage,
    this.size,
    this.selectedTextStyle,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Tooltip(
        message: tooltipMessage,
        child: SizedBox.fromSize(
          size: size,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              iconSize: 20,
              onChanged: (value) {
                if (value == null || value == selectedValue) return;
                onChanged(value);
              },
              elevation: 4,
              style: context.textTheme.bodyMedium,
              value: selectedValue,
              iconEnabledColor: foregroundColor,
              isDense: true,
              dropdownColor: context.colorScheme.background,
              selectedItemBuilder: (context) => items
                  .map((item) => Container(
                        alignment: Alignment.center,
                        width: size?.width ?? 100,
                        child: Text(
                          item.text,
                          style: selectedTextStyle ??
                              context.textTheme.bodySmall?.copyWith(
                                color: foregroundColor,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ))
                  .toList(),
              items: items
                  .map((item) => DropdownMenuItem<T>(
                        value: item.value,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(value: item.selected, onChanged: (_) {}),
                            hSpacerXSmall,
                            Expanded(
                              child: Text(
                                item.text,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context.colorScheme.onBackground,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

enum DropdownMenuType { menuOnly, tileWithMenu }

class CustomDropdownMenuItem<T> {
  final void Function()? onPressed;
  final String text;
  final Widget? leading;
  final bool selected;
  final T value;
  const CustomDropdownMenuItem({
    this.onPressed,
    this.leading,
    required this.value,
    required this.text,
    required this.selected,
  });
}
