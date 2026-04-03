import 'package:flutter/material.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/widgets/app_card_widget.dart';
import 'package:msar/src/features/home/views/widgets/home_carousel_widget.dart';

class HomeAllTabWidget extends StatelessWidget {
  const HomeAllTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        SliverToBoxAdapter(child: const HomeCarouselWidget().fadeUp()),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: List.generate(5, (index) => AppCardWidget().fadeUp()),
            ),
          ),
        ),
      ],
    );
  }
}
