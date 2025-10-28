import 'package:flutter/material.dart';

enum ProgressVariant { linear, circular, custom }

class CustomProgress extends StatelessWidget {
  final double? value; // 0.0 - 1.0, null = indeterminado
  final ProgressVariant variant;
  final Color? color;
  final Color? backgroundColor;
  final double? size; // Para circular o custom

  const CustomProgress({
    Key? key,
    this.value,
    this.variant = ProgressVariant.linear,
    this.color,
    this.backgroundColor,
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ProgressVariant.circular:
        return _buildCircular(context);
      case ProgressVariant.custom:
        return _buildCustom(context);
      case ProgressVariant.linear:
      default:
        return _buildLinear(context);
    }
  }

  // ======================================================
  // 🔵 VARIANTES
  // ======================================================

  Widget _buildLinear(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      color: color ?? Theme.of(context).colorScheme.primary,
      backgroundColor: backgroundColor ?? Colors.grey.shade300,
      minHeight: 6,
    );
  }

  Widget _buildCircular(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: value,
        color: color ?? Theme.of(context).colorScheme.primary,
        backgroundColor: backgroundColor ?? Colors.grey.shade300,
        strokeWidth: 6,
      ),
    );
  }

  Widget _buildCustom(BuildContext context) {
    // Ejemplo de custom: barra circular con porcentaje en el centro
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: value,
            strokeWidth: 8,
            color: color ?? Colors.deepPurple,
            backgroundColor: backgroundColor ?? Colors.deepPurple.shade100,
          ),
          if (value != null)
            Text(
              "${(value! * 100).toInt()}%",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
        ],
      ),
    );
  }
}
