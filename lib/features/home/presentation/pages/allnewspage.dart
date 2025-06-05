import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/repositories/news_repository.dart';
import '../bloc/news/news_bloc.dart';
import '../bloc/news/news_event.dart';
import '../bloc/news/news_state.dart';
import '../widget/bottomnavbar.dart';
import '../widget/shimmercard.dart';

class AllNewsPage extends StatelessWidget {
  final String title;
  const AllNewsPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => NewsBloc(NewsRepository())..add(SearchNews(title)),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const NewsShimmerCard(),
                );
              } else if (state is NewsError) {
                return Center(child: Text(state.message, style: const TextStyle(color: Colors.white)));
              } else if (state is NewsLoaded) {
                return ListView.builder(
                  itemCount: state.news.length > 20 ? 20 : state.news.length,
                  itemBuilder: (context, index) {
                    final news = state.news[index];
                    return GestureDetector(
                      onTap: () => context.push('/news_details', extra: news),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        height: 240,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl: news.imageUrl,
                                width: double.infinity,
                                height: 240,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) => const Center(
                                  child: Icon(Icons.broken_image, color: Colors.white, size: 50),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              left: 12,
                              right: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(news.title,
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 4),
                                  Text(
                                    news.content,
                                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text("Connection Error", style: TextStyle(color: Colors.white)));
            },
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
