import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';
import '../../../../core/fonts/fonts.dart';
import '../widget/bottomnavbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  void _searchNews(String query) {
    if (query.trim().isNotEmpty) {
      context.push('/all-news?title=${Uri.encodeComponent(query.trim())}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 24),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColor.greyScale500.withOpacity(0.1),
                  borderRadius: borderRadius,
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: AppColor.greyScale300),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: AppTextStyles.LargeMedium(color: AppColor.greyScale300),
                          border: InputBorder.none,
                        ),
                        style: AppTextStyles.LargeMedium(color: Colors.white),
                        onSubmitted: _searchNews,
                      ),
                    ),
                  ],
                ),
              ),
              const Text("Popular Tags:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
