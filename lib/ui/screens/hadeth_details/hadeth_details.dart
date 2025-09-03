import 'package:flutter/material.dart';
import 'package:islami_c16_sum/core/assets/app_images.dart';
import 'package:islami_c16_sum/core/styles/app_colors.dart';
import 'package:islami_c16_sum/core/styles/text_styles.dart';
import 'package:islami_c16_sum/ui/screens/home/models/hadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "/hadeth-details";
  final Hadeth hadeth;

  const HadethDetails({required this.hadeth, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(hadeth.name),
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Image.asset(AppImages.imgLeftCorner),
                Expanded(
                  child: Text(
                    hadeth.name,
                    style: TextStyles.largeLabelTextStyle(
                      textColor: AppColors.gold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppImages.imgRightCorner),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Text(
                hadeth.content,
                style: TextStyles.largeBodyTextStyle(textColor: AppColors.gold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset(AppImages.imgBottomDecoration),
        ],
      ),
    );
  }
}
