import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int activeIndex = 0;

  final List<String> images = [
    "https://picsum.photos/800/400?1",
    "https://picsum.photos/800/400?2",
    "https://picsum.photos/800/400?3",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIdx) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                imageUrl: images[index],
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ).fadeUp(),
            );
          },
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() => activeIndex = index);
            },
          ),
        ).fadeUp(),
        const SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.secondary,
            dotColor: Colors.grey.shade300,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
            spacing: 6,
          ),
        ).fadeUp(),
      ],
    );
  }
}
