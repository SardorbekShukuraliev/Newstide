import 'package:Newstide/core/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/_buildDropdownTile.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  _HelpSupportPageState createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(AppStrings.help_support, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/settings'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            ExpandableTile(title: "How to use the app?", content: "To use the app, create an account and explore..."),
            SizedBox(height: 16),
            ExpandableTile(title: "How to contact support?", content: "Email us at support@Newstide.com."),
          ],
        ),
      ),
    );
  }



}
