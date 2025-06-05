import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/colors/color.dart';
import '../../../../../core/fonts/fonts.dart';
import '../../../../../core/strings/strings.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/writer.png',
      'title': "True information",
      'text': 'Read the latest news around the world.',
    },
    {
      'image': 'assets/images/onlytrueinformation.png',
      'title': 'Stay Informed',
      'text': 'Your favorite topics delivered daily.',
    },
    {
      'image': 'assets/images/magazineinyourpocket.png',
      'title': 'Easy Navigation',
      'text': 'Browse and search news effortlessly.',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget _buildIndicator(bool isActive) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    height: 6,
    width: isActive ? 24 : 8,
    decoration: BoxDecoration(
      color: isActive ? AppColor.Primary : AppColor.greyScale300,
      borderRadius: BorderRadius.circular(4),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(pages[index]['image']!, height: 250),
                      const SizedBox(height: 32),
                      Text(pages[index]['title']!,
                          style: AppTextStyles.heading3(color: Colors.white)),
                      const SizedBox(height: 12),
                      Text(
                        pages[index]['text']!,
                        style: AppTextStyles.LargeMedium(
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => _buildIndicator(index == _currentPage),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Use Terms', style: AppTextStyles.Mediumregular(color: Colors.white)),
                const SizedBox(width: 12),
                Text('Privacy Policy', style: AppTextStyles.Mediumregular(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 24),
            _currentPage < pages.length - 1
                ? OutlinedButton(
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColor.Primary,
                  width: 1.8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                AppStrings.Next,
                style:
                AppTextStyles.XLargeBold(color: AppColor.Primary),
              ),
            )
                : ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('seen_onboarding', true);
                context.go('/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.Primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                AppStrings.GoToHomePage,
                style:
                AppTextStyles.heading5(color: AppColor.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
