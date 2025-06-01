import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';
import '../../data/repositories/news_repository.dart';
import '../bloc/news/news_bloc.dart';
import '../widget/BreakingNewsCard.dart';
import '../widget/PopularNewsGridItem.dart';
import '../widget/SectionHeader.dart';
import '../widget/bottomnavbar.dart';
import '../widget/custom_search_bar.dart';
import '../widget/user_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _breakingNewsPageController = PageController(viewportFraction: 0.85);
  final int _breakingNewsCount = 6; // Ограничение для Breaking News
  final int _popularNewsCount = 12; // Теперь загружаем 12 карточек популярных новостей

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: const UserHeader(userName: "User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) => NewsBloc(NewsRepository())..add(FetchNews()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsError) {
                return Center(child: Text(state.message));
              } else if (state is NewsLoaded) {
                final breakingNews = state.news.take(_breakingNewsCount).toList();
                final popularNews = state.news.take(_popularNewsCount).toList();

                return ListView(
                  children: [
                    const CustomSearchBar(),
                    SectionHeader(
                      title: 'Breaking News',
                      onTap: () => context.push('/all-news?title=Breaking News'),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 260,
                      child: PageView.builder(
                        itemCount: breakingNews.length,
                        controller: _breakingNewsPageController,
                        itemBuilder: (context, index) {
                          final news = breakingNews[index];
                          return BreakingNewsCard(
                            news: news,
                            onTap: () => context.push('/news_details', extra: news),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    SectionHeader(
                      title: 'Popular News',
                      onTap: () => context.push('/all-news?title=Popular News'),
                    ),
                    const SizedBox(height: 10),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 0.75,
                      children: popularNews.map((news) {
                        return PopularNewsCard(
                          news: news,
                          onTap: () => context.push('/news_details', extra: news),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }

  @override
  void dispose() {
    _breakingNewsPageController.dispose();
    super.dispose();
  }
}



