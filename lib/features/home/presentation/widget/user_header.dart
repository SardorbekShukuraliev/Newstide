import 'package:flutter/material.dart';
import '../../../../core/colors/color.dart';
import '../../../../core/fonts/fonts.dart';

class UserHeader extends StatelessWidget {
  final String userName;

  const UserHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 24),
        Text(
          "Newstide",
          style: AppTextStyles.heading4().copyWith(color: AppColor.white),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
