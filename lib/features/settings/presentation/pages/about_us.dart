import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.black,
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(6.0),
          thumbColor: MaterialStateProperty.all(AppColor.Primary),
          radius: const Radius.circular(4.0),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 1,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About Us"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/settings'),
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: const Text(
              '''
Welcome to Newstide!

We are a team of passionate developers, designers, and visionaries who believe in the power of digital tools to support mental health and personal growth. Our mission is to make emotional well-being accessible, modern, and intuitive for everyone.

What we stand for:
- Empathy-driven design: Every element in Newstide is built with care and compassion.
- Data privacy: Your feelings and your information are yours. We don’t sell, trade, or misuse them.
- Innovation with purpose: We’re not just building an app—we’re creating a companion that helps you face life’s storms.

Why we started:
We’ve all faced hard times. We know what it’s like to need support and not know where to turn. That’s why we built Newstide—to be a lighthouse for anyone sailing through darkness.

Contact us:
We love feedback, thoughts, and collaboration. Drop us a line anytime: support@updatss.com

Thank you for being part of our journey.

With care,  
The Newstide Team
              ''',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.white,  // Белый цвет текста
              ),
            ),
          ),
        ),
      ),
    );
  }
}
