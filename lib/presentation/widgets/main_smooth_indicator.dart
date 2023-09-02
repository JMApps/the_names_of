import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainSmoothIndicator extends StatelessWidget {
  const MainSmoothIndicator({
    super.key,
    required this.controller,
    required this.count,
    required this.dotColor,
  });

  final PageController controller;
  final int count;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ScrollingDotsEffect(
        maxVisibleDots: 5,
        activeDotColor: dotColor,
        dotHeight: 8,
        dotWidth: 8,
      ),
    );
  }
}
