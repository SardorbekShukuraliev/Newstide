import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';
import '../../../../core/fonts/fonts.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/search_page'),
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.greyScale400.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColor.greyScale400),
            const SizedBox(width: 8),
            Text('Search', style: AppTextStyles.LargeMedium(color: AppColor.greyScale400)),
          ],
        ),
      ),
    );
  }
}
