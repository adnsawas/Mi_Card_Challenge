import 'package:flutter/material.dart';

class PageViewIndexIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  final Color? indicatorColor;
  final void Function(int index)? onTap;
  const PageViewIndexIndicator(
      {super.key,
      required this.length,
      required this.currentIndex,
      this.indicatorColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          length,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(index);
                    }
                  },
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index == currentIndex
                          ? indicatorColor ?? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              )),
    );
  }
}
