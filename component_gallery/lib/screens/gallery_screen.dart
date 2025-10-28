import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/custom_badge.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_alert.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_progress.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  Widget _buildSectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de Componentes'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔘 BOTONES
            _buildSectionTitle(Icons.radio_button_checked, '1. Botones'),
            _buildSectionCard(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  CustomButton(text: 'Primary', variant: ButtonVariant.primary),
                  CustomButton(text: 'Secondary', variant: ButtonVariant.secondary),
                  CustomButton(text: 'Outlined', variant: ButtonVariant.outlined),
                ],
              ),
            ),

            // 📇 TARJETAS
            _buildSectionTitle(Icons.credit_card, '2. Tarjetas'),
            _buildSectionCard(
              child: Column(
                children: const [
                  CustomCard(
                    variant: CardVariant.elevated,
                    child: Text('Elevated Card'),
                  ),
                  SizedBox(height: 10),
                  CustomCard(
                    variant: CardVariant.outlined,
                    child: Text('Outlined Card'),
                  ),
                  SizedBox(height: 10),
                  CustomCard(
                    variant: CardVariant.filled,
                    child: Text('Filled Card'),
                  ),
                ],
              ),
            ),

            // 👤 AVATARES
            _buildSectionTitle(Icons.person, '3. Avatares'),
            _buildSectionCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomAvatar(initials: 'AB', variant: AvatarVariant.circular),
                  CustomAvatar(initials: 'CD', variant: AvatarVariant.rounded),
                  CustomAvatar(initials: 'EF', variant: AvatarVariant.square),
                ],
              ),
            ),

            // 🏷️ BADGES
            _buildSectionTitle(Icons.label, '4. Badges'),
            _buildSectionCard(
              child: Wrap(
                spacing: 10,
                children: const [
                  CustomBadge(text: 'Info', variant: BadgeVariant.info),
                  CustomBadge(text: 'Success', variant: BadgeVariant.success),
                  CustomBadge(text: 'Warning', variant: BadgeVariant.warning),
                  CustomBadge(text: 'Error', variant: BadgeVariant.error),
                ],
              ),
            ),

            // 🔖 CHIPS
            _buildSectionTitle(Icons.local_offer, '5. Chips'),
            _buildSectionCard(
              child: Wrap(
                spacing: 8,
                children: const [
                  CustomChip(label: 'Default', variant: ChipVariant.defaultChip),
                  CustomChip(label: 'Outlined', variant: ChipVariant.outlined),
                  CustomChip(label: 'Colored', variant: ChipVariant.colored),
                ],
              ),
            ),

            // ⚠️ ALERTAS
            _buildSectionTitle(Icons.warning, '6. Alertas'),
            _buildSectionCard(
              child: Column(
                children: const [
                  CustomAlert(message: 'Información general', variant: AlertVariant.info),
                  SizedBox(height: 10),
                  CustomAlert(message: 'Operación exitosa', variant: AlertVariant.success),
                  SizedBox(height: 10),
                  CustomAlert(message: 'Advertencia importante', variant: AlertVariant.warning),
                  SizedBox(height: 10),
                  CustomAlert(message: 'Ha ocurrido un error', variant: AlertVariant.error),
                ],
              ),
            ),

            // ✏️ INPUTS
            _buildSectionTitle(Icons.text_fields, '7. Inputs'),
            _buildSectionCard(
              child: Column(
                children: const [
                  CustomInput(hintText: 'Standard input', variant: InputVariant.standard),
                  SizedBox(height: 10),
                  CustomInput(hintText: 'Outlined input', variant: InputVariant.outlined),
                  SizedBox(height: 10),
                  CustomInput(hintText: 'Filled input', variant: InputVariant.filled),
                ],
              ),
            ),

            // ⏳ PROGRESOS
            _buildSectionTitle(Icons.timelapse, '8. Progreso'),
            _buildSectionCard(
              child: Column(
                children: const [
                  CustomProgress(variant: ProgressVariant.linear, value: 0.6),
                  SizedBox(height: 20),
                  CustomProgress(variant: ProgressVariant.circular, value: 0.7),
                  SizedBox(height: 20),
                  CustomProgress(variant: ProgressVariant.custom, value: 0.5),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Center(
              child: Text(
                '© 2025 - Galería de Componentes Flutter',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}