import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: currentIndex,
      selectedItemColor: AppColor.Primary,
      unselectedItemColor: AppColor.greyScale500,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/search_page');
            break;
          case 2:
            context.go('/all-news');
            break;
          case 3:
            context.go('/settings');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            IconsaxPlusBold.home_2,
            color: currentIndex == 0 ? AppColor.Primary : AppColor.greyScale500,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsaxPlusBold.search_normal_1,
            color: currentIndex == 1 ? AppColor.Primary : AppColor.greyScale500,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsaxPlusBold.note_21,
            color: currentIndex == 2 ? AppColor.Primary : AppColor.greyScale500,
          ),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsaxPlusBold.setting_2,
            color: currentIndex == 3 ? AppColor.Primary : AppColor.greyScale500,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
