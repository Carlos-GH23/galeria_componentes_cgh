import 'package:flutter/material.dart';

enum AlertVariant { info, success, warning, error }

class CustomAlert extends StatelessWidget {
  final String message;
  final AlertVariant variant;
  final IconData? icon;
  final VoidCallback? onClose;

  const CustomAlert({
    super.key,
    required this.message,
    required this.variant,
    this.icon,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Color iconColor;

    switch (variant) {
      case AlertVariant.info:
        backgroundColor = Colors.blue.shade50;
        borderColor = Colors.blue.shade300;
        iconColor = Colors.blue.shade700;
        break;
      case AlertVariant.success:
        backgroundColor = Colors.green.shade50;
        borderColor = Colors.green.shade300;
        iconColor = Colors.green.shade700;
        break;
      case AlertVariant.warning:
        backgroundColor = Colors.amber.shade50;
        borderColor = Colors.amber.shade400;
        iconColor = Colors.amber.shade700;
        break;
      case AlertVariant.error:
        backgroundColor = Colors.red.shade50;
        borderColor = Colors.red.shade300;
        iconColor = Colors.red.shade700;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon ?? _defaultIcon(variant), color: iconColor, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                height: 1.3,
              ),
            ),
          ),
          if (onClose != null)
            IconButton(
              icon: const Icon(Icons.close, size: 20),
              color: Colors.grey.shade700,
              onPressed: onClose,
              splashRadius: 18,
              tooltip: 'Cerrar',
            ),
        ],
      ),
    );
  }

  IconData _defaultIcon(AlertVariant variant) {
    switch (variant) {
      case AlertVariant.info:
        return Icons.info_outline;
      case AlertVariant.success:
        return Icons.check_circle_outline;
      case AlertVariant.warning:
        return Icons.warning_amber_outlined;
      case AlertVariant.error:
        return Icons.error_outline;
    }
  }
}
