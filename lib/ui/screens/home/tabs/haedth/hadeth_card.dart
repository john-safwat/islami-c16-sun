import 'package:flutter/material.dart';
import 'package:islami_c16_sum/core/assets/app_images.dart';
import 'package:islami_c16_sum/core/styles/app_colors.dart';
import 'package:islami_c16_sum/core/styles/text_styles.dart';
import 'package:islami_c16_sum/ui/screens/home/models/hadeth.dart';

class HadethCard extends StatelessWidget {
  final Hadeth hadeth;

  const HadethCard({required this.hadeth, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(AppImages.hadethCardBackground),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(AppImages.imgLeftCorner),
                  color: AppColors.black,
                  size: 72,
                ),
                Expanded(child: Text(hadeth.name, textAlign: TextAlign.center)),
                ImageIcon(
                  AssetImage(AppImages.imgRightCorner),
                  color: AppColors.black,
                  size: 72,
                ),
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(hadeth.content , textAlign: TextAlign.center , style: TextStyles.largeBodyTextStyle(textColor: AppColors.black),),
          )),
          Image.asset(AppImages.imgBottomDecoration, color: AppColors.black),
        ],
      ),
    );
  }
}
