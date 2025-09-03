import 'package:flutter/material.dart';
import 'package:islami_c16_sum/core/assets/app_images.dart';
import 'package:islami_c16_sum/core/styles/app_colors.dart';
import 'package:islami_c16_sum/core/styles/text_styles.dart';
import 'package:islami_c16_sum/ui/screens/home/models/sura.dart';
import 'package:islami_c16_sum/ui/screens/sura_details/sura_details.dart';

class SuraCard extends StatelessWidget {
  final Sura sura;

  const SuraCard({required this.sura, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName, arguments: sura);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppImages.suraNumberDecoration,
                height: 70,
                width: 70,
              ),
              Text(
                sura.id.toString(),
                style: TextStyles.mediumLabelTextStyle(
                  textColor: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEn,
                  style: TextStyles.mediumLabelTextStyle(
                    textColor: AppColors.white,
                  ),
                ),
                Text(
                  sura.ayaNumbers,
                  style: TextStyles.mediumLabelTextStyle(
                    textColor: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(
            sura.nameAr,
            style: TextStyles.mediumLabelTextStyle(textColor: AppColors.white),
          ),
        ],
      ),
    );
  }
}
