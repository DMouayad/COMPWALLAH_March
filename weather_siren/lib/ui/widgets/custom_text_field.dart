import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_siren/ui/utils/context_extensions.dart';

class CustomTextField extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final bool obscure;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final bool filled;
  final Color? fillColor;
  final Color? hoverColor;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Key? formKey;
  final bool isDense;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;

  const CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.autovalidateMode,
    this.controller,
    this.onSaved,
    this.prefixIcon,
    this.textInputAction,
    this.obscure = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.initialValue,
    this.onEditingComplete,
    this.filled = true,
    this.fillColor,
    this.textDirection,
    this.hoverColor,
    this.textStyle,
    this.hintTextStyle,
    this.prefixIconColor,
    this.onChanged,
    this.formKey,
    this.isDense = false,
    this.maxLength,
    this.suffixIcon,
    this.suffixIconColor,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? inputIsValid;
  final _errorSuffixIcon = const Icon(Icons.error_outline, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    final kOutlinedBorder = OutlineInputBorder(
      borderRadius: context.platformBorderRadius,
      borderSide: BorderSide(width: 1.3, color: context.textFieldBorderColor),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        enabled: widget.enabled,
        textDirection: widget.textDirection,
        maxLength: widget.maxLength,
        controller: widget.controller,
        key: widget.formKey,
        initialValue: widget.initialValue,
        validator: widget.validator,
        onChanged: (value) {
          if (widget.validator != null) {
            final newValidValue = widget.validator!(value) == null;
            if (inputIsValid != newValidValue) {
              setState(() => inputIsValid = newValidValue);
            }
          }
        },
        onSaved: widget.onSaved,
        obscureText: widget.obscure,
        keyboardType: widget.keyboardType,
        onEditingComplete: widget.onEditingComplete,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        style: widget.textStyle ??
            context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.colorScheme.onBackground,
            ),
        autovalidateMode:
            widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          isDense: widget.isDense,
          filled: widget.filled,
          fillColor: widget.fillColor ??
              (context.isDarkMode ? Colors.black26 : Colors.white60),
          suffixIcon: widget.suffixIcon ??
              ((inputIsValid ?? true) ? null : _errorSuffixIcon),
          // contentPadding: EdgeInsets.all(0),
          suffixIconColor: widget.suffixIconColor,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.prefixIconColor ?? context.colorScheme.onBackground,
            size: 20,
          ),
          hintText: widget.hintText,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onBackground.withOpacity(.8),
          ),
          enabledBorder: kOutlinedBorder,
          focusedBorder: kOutlinedBorder.copyWith(
            borderSide: BorderSide(
              width: 1.5,
              color: context.colorScheme.primary,
            ),
          ),
          errorBorder: kOutlinedBorder.copyWith(
            borderSide: BorderSide(color: context.colorScheme.error),
          ),
          focusedErrorBorder: kOutlinedBorder.copyWith(
            borderSide: BorderSide(color: context.colorScheme.error, width: 2),
          ),
          errorStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.error,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
