import 'package:flutter/material.dart';

/// Variantes de la tarjeta
enum CardVariant { elevated, outlined, filled }

class CustomCard extends StatelessWidget {
  final Widget child;
  final CardVariant variant;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomCard({
    super.key,
    required this.child,
    this.variant = CardVariant.elevated,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    double elevation = 0.0;
    BorderSide border = BorderSide.none;

    switch (variant) {
      case CardVariant.elevated:
        backgroundColor = Colors.white;
        elevation = 4.0;
        break;
      case CardVariant.outlined:
        backgroundColor = Colors.white;
        border = BorderSide(color: Colors.grey.shade400, width: 1.5);
        break;
      case CardVariant.filled:
        backgroundColor = Colors.blue.shade50;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: elevation,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: border,
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
