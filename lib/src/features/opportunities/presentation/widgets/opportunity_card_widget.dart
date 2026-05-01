import 'package:flutter/material.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/features/opportunities/domain/entities/opportunity.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class OpportunityCardWidget extends StatelessWidget {
  const OpportunityCardWidget({super.key, required this.opportunity});

  final Opportunity opportunity;

  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inSeconds < 60) return 'منذ لحظات';
    if (diff.inMinutes < 60) return 'منذ ${diff.inMinutes} دقيقة';
    if (diff.inHours < 24) return 'منذ ${diff.inHours} ساعة';
    if (diff.inDays < 30) return 'منذ ${diff.inDays} يوم';
    if (diff.inDays < 365) return 'منذ ${(diff.inDays / 30).floor()} شهر';
    return 'منذ ${(diff.inDays / 365).floor()} سنة';
  }

  Future<void> _openWhatsApp(String number) async {
    final clean = number.replaceAll(RegExp(r'[^\d+]'), '');
    final uri = Uri.parse('https://wa.me/$clean');
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.border, blurRadius: 7)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.icon).fadeUp(),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  opportunity.title,
                  style: const TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ).fadeUp(),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            opportunity.company,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ).fadeUp(),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.greenLight,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppIcons.time, width: 14, height: 14),
                const SizedBox(width: 6),
                Text(
                  _timeAgo(opportunity.createdAt),
                  style: const TextStyle(
                    color: AppColors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ).fadeUp(),
          ),
          const SizedBox(height: 10),
          Text(
            opportunity.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.grey, height: 1.5),
          ).fadeUp(),
          if (opportunity.city.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 15, color: AppColors.primary),
                const SizedBox(width: 4),
                Text(
                  opportunity.city,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ).fadeUp(),
          ],
          if (opportunity.whatsapp.isNotEmpty) ...[
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: GestureDetector(
                onTap: () => _openWhatsApp(opportunity.whatsapp),
                child: SvgPicture.asset(AppIcons.whatsapp, width: 30),
              ).fadeUp(),
            ),
          ],
        ],
      ),
    );
  }
}
