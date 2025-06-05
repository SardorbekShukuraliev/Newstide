import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';
import '../../../../core/strings/strings.dart';

class LegalPoliciesPage extends StatelessWidget {
  const LegalPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(AppColor.Primary),
          thickness: MaterialStateProperty.all(6.0),
          radius: const Radius.circular(4.0),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Legal & Policies"),
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
             AppStrings.legal,
              style: TextStyle(color: Colors.white,fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
