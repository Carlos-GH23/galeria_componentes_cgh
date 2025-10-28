import 'package:flutter/material.dart';

/// ======================================================
/// 🏷️ CUSTOM BADGE
/// Pequeñas etiquetas de estado o información
/// ======================================================

/// Enum que define los tipos de badge disponibles
enum BadgeVariant { info, success, warning, error }

/// Widget visual sin estado que muestra un badge colorido
class CustomBadge extends StatelessWidget {
  final String text;
  final BadgeVariant variant;

  const CustomBadge({
    Key? key,
    required this.text,
    this.variant = BadgeVariant.info,
  }) : super(key: key);

  // 🎨 Paleta de colores globales
  static const double _borderRadius = 20.0;

  static const Color _infoColor = Color(0xFF2196F3);
  static const Color _successColor = Color(0xFF43A047);
  static const Color _warningColor = Color(0xFFFFA000);
  static const Color _errorColor = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case BadgeVariant.info:
        return _buildBadge(_infoColor);
      case BadgeVariant.success:
        return _buildBadge(_successColor);
      case BadgeVariant.warning:
        return _buildBadge(_warningColor);
      case BadgeVariant.error:
        return _buildBadge(_errorColor);
    }
  }

  // ======================================================
  // 🟩 ESTRUCTURA BASE DEL BADGE
  // ======================================================

  Widget _buildBadge(Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
