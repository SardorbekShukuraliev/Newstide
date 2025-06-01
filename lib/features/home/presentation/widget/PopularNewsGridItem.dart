import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/NewsModel.dart';

class PopularNewsCard extends StatelessWidget {
  final NewsModel news;
  final VoidCallback onTap;
  final VoidCallback? onLoadMore;
  final bool showLoadMore;
  final bool isLoading;

  const PopularNewsCard({
    super.key,
    required this.news,
    required this.onTap,
    this.onLoadMore,
    this.showLoadMore = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: news.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[800],
                  child: const Center(child: Icon(Icons.image, size: 50, color: Colors.white)),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[800],
                  child: const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.white)),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(1)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              bottom: 8,
              right: 8,
              child: Text(
                news.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  shadows: [
                    Shadow(color: Colors.black45, offset: Offset(1, 1), blurRadius: 2),
                  ],
                ),
              ),
            ),
            if (showLoadMore && onLoadMore != null)
              Positioned(
                bottom: 30,
                right: 30,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : ElevatedButton(
                  onPressed: onLoadMore,
                  child: const Text('Load More'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
