import 'package:flutter/material.dart';

enum ChipVariant { defaultChip, outlined, colored }

class CustomChip extends StatelessWidget {
  final String label;
  final ChipVariant variant;
  final VoidCallback? onDeleted;
  final bool selected;

  const CustomChip({
    Key? key,
    required this.label,
    this.variant = ChipVariant.defaultChip,
    this.onDeleted,
    this.selected = false,
  }) : super(key: key);

  Color _getBackgroundColor(BuildContext context) {
    switch (variant) {
      case ChipVariant.colored:
        return selected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(0.2);
      case ChipVariant.outlined:
        return Colors.transparent;
      default:
        return selected
            ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
            : Theme.of(context).chipTheme.backgroundColor ?? Colors.grey[200]!;
    }
  }

  BorderSide _getBorderSide(BuildContext context) {
    if (variant == ChipVariant.outlined) {
      return BorderSide(
        color: selected
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade400,
      );
    }
    return BorderSide.none;
  }

  TextStyle _getTextStyle(BuildContext context) {
    return TextStyle(
      color: selected
          ? (variant == ChipVariant.colored
                ? Colors.white
                : Theme.of(context).colorScheme.primary)
          : Colors.black87,
      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: InputChip(
        label: Text(label, style: _getTextStyle(context)),
        backgroundColor: _getBackgroundColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: _getBorderSide(context),
        ),
        selected: selected,
        onDeleted: onDeleted,
        deleteIconColor: selected ? Colors.white : Colors.grey[700],
        selectedColor: variant == ChipVariant.colored
            ? Theme.of(context).colorScheme.primary
            : _getBackgroundColor(context),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
