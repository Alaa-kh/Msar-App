import 'package:flutter/material.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/features/home/views/widgets/home_carousel_widget.dart';
import 'package:svg_flutter/svg.dart';

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
              children: List.generate(
                5,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: AppColors.border, blurRadius: 7),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AppIcons.icon).fadeUp(),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'مطلوب مهندس مدني للعمل في مشاريع كبرى',
                              style: TextStyle(
                                color: AppColors.primaryDark,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ).fadeUp(),
                          ),
                        ],
                      ),
                      SizedBox(height: 17),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.greenLight,
                        ),
                        child: FittedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppIcons.time),
                              SizedBox(width: 7),
                              Text(
                                'منذ ثانيتين',
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ).fadeUp(),
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        'نبحث عن مهندس مدني ذو خبرة لا تقل عن خمس سنوات للعمل في مشاريع إنشائية ضخمة.يجب ان يكون لديه إلمام بأحدث التقنيات والمعايير الهندسية.',
                        style: TextStyle(color: AppColors.grey, height: 1.5),
                      ).fadeUp(),
                      Align(
                        alignment: AlignmentGeometry.bottomLeft,
                        child: SvgPicture.asset(AppIcons.whatsapp, width: 30),
                      ).fadeUp(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
