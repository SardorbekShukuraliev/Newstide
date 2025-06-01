import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/NewsModel.dart';

class BreakingNewsCard extends StatelessWidget {
  final NewsModel news;
  final VoidCallback onTap;
  final VoidCallback? onLoadMore;
  final bool showLoadMore;
  final bool isLoading;

  const BreakingNewsCard({
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
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: news.imageUrl,
                width: 300,
                height: 180,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 300,
                  height: 180,
                  color: Colors.grey[800],
                  child: const Center(child: Icon(Icons.image, size: 50, color: Colors.white)),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 300,
                  height: 180,
                  color: Colors.grey[800],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Text(
                  news.title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (showLoadMore && onLoadMore != null)
              Positioned(
                bottom: 200,
                right: 100,
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
