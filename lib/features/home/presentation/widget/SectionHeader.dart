import 'package:flutter/material.dart';
import '../../../../core/fonts/fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.heading5(color: Colors.white)),
        TextButton(
          onPressed: onTap,
          child: Text('See more', style: AppTextStyles.MediumBold(color: Colors.white)),
        ),
      ],
    );
  }
}