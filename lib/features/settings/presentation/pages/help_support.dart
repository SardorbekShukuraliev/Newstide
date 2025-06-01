import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/colors/color.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  _HelpSupportPageState createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  bool _isFirstOpen = false;
  bool _isSecondOpen = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.black, // Ночной фон
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Help & Support', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/settings'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDropdownTile(
              title: 'How to use the app?',
              content:
              'To use the app, simply create an account, log in, and explore the features from the home screen...',
              isOpen: _isFirstOpen,
              onPressed: () {
                setState(() {
                  _isFirstOpen = !_isFirstOpen;
                  _isSecondOpen = false;
                });
              },
              primaryColor: primaryColor,
            ),
            const SizedBox(height: 16),
            _buildDropdownTile(
              title: 'How to contact support?',
              content:
              'You can reach our support team by emailing support@Newstide.com or using the feedback form in the settings.',
              isOpen: _isSecondOpen,
              onPressed: () {
                setState(() {
                  _isSecondOpen = !_isSecondOpen;
                  _isFirstOpen = false;
                });
              },
              primaryColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownTile({
    required String title,
    required String content,
    required bool isOpen,
    required VoidCallback onPressed,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColor.greyScale900,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
            if (isOpen) ...[
              const SizedBox(height: 12),
              Text(
                content,
                style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              ),
            ],
          ],
        ),
      ),
    );
  }

}
