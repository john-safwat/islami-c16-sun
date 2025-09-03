import 'package:flutter/material.dart';
import 'package:islami_c16_sum/core/assets/app_images.dart';
import 'package:islami_c16_sum/core/styles/app_colors.dart';
import 'package:islami_c16_sum/core/styles/text_styles.dart';
import 'package:islami_c16_sum/ui/screens/home/models/sura.dart';

class MostRecentCard extends StatelessWidget {
  final Sura sura;
  final Function(Sura) onSuraClick;

  const MostRecentCard({
    required this.sura,
    required this.onSuraClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onSuraClick(sura);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sura.nameEn,
                  style: TextStyles.largeLabelTextStyle(
                    textColor: AppColors.black,
                  ),
                ),
                Text(
                  sura.nameAr,
                  style: TextStyles.largeLabelTextStyle(
                    textColor: AppColors.black,
                  ),
                ),
                Text(
                  "${sura.ayaNumbers} Verses",
                  style: TextStyles.largeBodyTextStyle(
                    textColor: AppColors.black,
                  ),
                ),
              ],
            ),
            Image.asset(AppImages.imgMostRecent),
          ],
        ),
      ),
    );
  }
}
