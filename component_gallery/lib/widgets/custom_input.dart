import 'package:flutter/material.dart';

enum InputVariant { standard, outlined, filled }

class CustomInput extends StatelessWidget {
  final String hintText;
  final InputVariant variant;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? labelText;

  const CustomInput({
    Key? key,
    required this.hintText,
    this.variant = InputVariant.standard,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
    this.labelText,
  }) : super(key: key);

  InputBorder _getBorder(Color color) {
    switch (variant) {
      case InputVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color, width: 1.4),
        );
      case InputVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        );
      case InputVariant.standard:
      default:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.2),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color borderColor = Colors.grey.shade400;
    Color focusedColor = theme.colorScheme.primary;
    Color fillColor = variant == InputVariant.filled
        ? Colors.grey.shade100
        : Colors.transparent;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.grey[700])
            : null,
        labelText: labelText,
        hintText: hintText,
        filled: variant == InputVariant.filled,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        enabledBorder: _getBorder(borderColor),
        focusedBorder: _getBorder(focusedColor),
        border: _getBorder(borderColor),
      ),
      style: const TextStyle(fontSize: 15.5),
    );
  }
}
