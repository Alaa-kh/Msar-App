import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/features/banners/presentation/cubit/banners_cubit.dart';
import 'package:msar/src/features/banners/presentation/cubit/banners_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      builder: (context, state) {
        if (state.status == BannersStatus.initial ||
            state.status == BannersStatus.loading) {
          return _buildShimmer();
        }

        if (state.status == BannersStatus.failure ||
            state.banners.isEmpty) {
          return const SizedBox.shrink();
        }

        final banners = state.banners;

        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: banners.length,
              itemBuilder: (context, index, realIdx) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: CachedNetworkImage(
                    imageUrl: banners[index].imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => _shimmerBox(),
                    errorWidget: (_, _, _) => Container(
                      color: AppColors.primaryLight,
                      child: const Icon(Icons.image_not_supported_outlined,
                          color: AppColors.primary, size: 40),
                    ),
                  ).fadeUp(),
                );
              },
              options: CarouselOptions(
                height: 180,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlay: banners.length > 1,
                autoPlayInterval: const Duration(seconds: 4),
                onPageChanged: (index, _) =>
                    setState(() => _activeIndex = index),
              ),
            ).fadeUp(),
            if (banners.length > 1) ...[
              const SizedBox(height: 12),
              AnimatedSmoothIndicator(
                activeIndex: _activeIndex,
                count: banners.length,
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
          ],
        );
      },
    );
  }

  Widget _buildShimmer() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 8,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _shimmerBox() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(color: Colors.white),
    );
  }
}
