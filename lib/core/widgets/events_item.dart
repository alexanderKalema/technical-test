import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test/core/constants/app_text_theme.dart';

class EventsItem extends StatelessWidget {
  final String meshbackground;
  final String title;
  final String type;
  final String subtitle;
  final String time;
  final List<String> imageUrls;

  const EventsItem({
    super.key,
    required this.meshbackground,
    required this.title,
    required this.type,
    required this.subtitle,
    required this.time,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              meshbackground,
          )
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: AppTextTheme.SF_F14W400CWhite.copyWith(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    type,
                    style: AppTextTheme.SF_F14W400CWhite,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Text(
              title,
              style: AppTextTheme.SF_F24W400CWhite,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  time,
                  style: AppTextTheme.SF_F14W400CWhite,
                ),
                const Expanded(child: SizedBox()),
                OverlappingAvatars(imageUrls: imageUrls),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OverlappingAvatars extends StatelessWidget {
  final List<String> imageUrls;

  const OverlappingAvatars({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        itemCount: imageUrls.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        reverse: false,
        itemBuilder: (context, index) {
          return Align(
            widthFactor: 0.6,
            child: ClipOval(
              child: Image.asset(
                imageUrls[index],
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
