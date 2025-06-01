import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/color.dart';
import '../../../home/presentation/widget/bottomnavbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          onPrimary: Colors.white,
          surface: Colors.grey[900]!,
          onSurface: Colors.white70,
        ),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSection(
                title: 'User Profile',
                icon: Icons.account_circle,
                text: 'Your profile settings',
                onTap: () => context.go('/profile'),
              ),
              const SizedBox(height: 20),
              const Text(
                'About',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSection(
                title: 'Legal and Policies',
                icon: Icons.shield_outlined,
                text: 'Legal and Policies rules',
                onTap: () => context.go('/politics'),
              ),
              _buildSection(
                title: 'Help & Support',
                icon: Icons.question_mark,
                text: 'Help & Support for you',
                onTap: () => context.go('/support'),
              ),
              _buildSection(
                title: 'About Us',
                icon: Icons.info,
                text: 'About our app',
                onTap: () => context.go('/aboutus'),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade900,
              child: Icon(icon, color: AppColor.Primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 16),
          ],
        ),
      ),
    );
  }
}
