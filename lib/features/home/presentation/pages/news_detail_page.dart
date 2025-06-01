import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';
import '../../data/models/NewsModel.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsModel news;

  const NewsDetailPage({super.key, required this.news});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  double _fontSize = 16.0;
  bool _showFontOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
            children: [
              if (widget.news.imageUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.news.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                    },
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                widget.news.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.news.content,
                style: TextStyle(
                  fontSize: _fontSize,
                  height: 1.5,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          SafeArea(
            minimum: const EdgeInsets.only(bottom: 16),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(bottom: _showFontOptions ? 80 : 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_showFontOptions)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 8)],
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        children: [12.0, 14.0, 16.0, 18.0, 20.0, 22.0, 24.0].map((size) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _fontSize = size;
                                _showFontOptions = false;
                              });
                            },
                            child: Chip(
                              backgroundColor: Colors.grey[800],
                              label: Text(
                                size.toInt().toString(),
                                style: TextStyle(fontSize: size, color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  Container(
                    width: 260,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColor.greyScale900,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => context.push('/home'),
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _showFontOptions = !_showFontOptions;
                            });
                          },
                          icon: const Icon(Icons.text_fields, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
