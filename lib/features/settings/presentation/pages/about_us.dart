import 'package:Newstide/core/strings/strings.dart';
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
              child: Text(AppStrings.about_us, style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
        ),
      ),
    );
  }
}
