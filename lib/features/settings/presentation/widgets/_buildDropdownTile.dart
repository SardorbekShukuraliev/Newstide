import 'package:flutter/material.dart';
import '../../../../core/colors/color.dart';

class ExpandableTile extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableTile({super.key, required this.title, required this.content});

  @override
  _ExpandableTileState createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isOpen = !_isOpen),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(color: AppColor.greyScale900, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
                Icon(_isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
            if (_isOpen) ...[
              const SizedBox(height: 12),
              Text(widget.content, style: const TextStyle(fontSize: 14, color: Colors.white70)),
            ],
          ],
        ),
      ),
    );
  }
}
