import 'package:flutter/material.dart';

/// ======================================================
/// 👤 CUSTOM AVATAR
/// Avatares personalizados con diferentes formas y estilos
/// ======================================================

/// Enum que define las variantes de forma del avatar
enum AvatarVariant { circular, rounded, square }

/// Widget visual sin estado que muestra imagen o iniciales
class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final AvatarVariant variant;
  final double size;
  final Color? backgroundColor;

  const CustomAvatar({
    Key? key,
    this.imageUrl,
    this.initials,
    this.variant = AvatarVariant.circular,
    this.size = 64.0,
    this.backgroundColor,
  }) : super(key: key);

  // 🎨 Colores base
  static const Color _defaultBackground = Color(0xFF90CAF9);
  static const Color _textColor = Colors.white;
  static const double _borderRadiusRounded = 12.0;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case AvatarVariant.circular:
        return _buildCircular();
      case AvatarVariant.rounded:
        return _buildRounded();
      case AvatarVariant.square:
        return _buildSquare();
    }
  }

  // ======================================================
  // 🔵 VARIANTES DE AVATAR
  // ======================================================

  /// Avatar circular (estilo clásico)
  Widget _buildCircular() {
    return _buildBaseAvatar(shape: BoxShape.circle, borderRadius: null);
  }

  /// Avatar cuadrado con bordes redondeados
  Widget _buildRounded() {
    return _buildBaseAvatar(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(_borderRadiusRounded),
    );
  }

  /// Avatar cuadrado sin bordes redondeados
  Widget _buildSquare() {
    return _buildBaseAvatar(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.zero,
    );
  }

  // ======================================================
  // 🧱 ESTRUCTURA BASE DEL AVATAR
  // ======================================================

  Widget _buildBaseAvatar({
    required BoxShape shape,
    BorderRadius? borderRadius,
  }) {
    final Color bgColor = backgroundColor ?? _defaultBackground;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: shape,
        borderRadius: borderRadius,
        image: imageUrl != null
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: imageUrl == null
          ? Text(
              (initials ?? "").toUpperCase(),
              style: const TextStyle(
                color: _textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          : null,
    );
  }
}
