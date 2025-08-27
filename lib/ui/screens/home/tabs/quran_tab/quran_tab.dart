import 'package:flutter/material.dart';
import 'package:islami_c16_sum/core/assets/app_images.dart';
import 'package:islami_c16_sum/core/styles/app_colors.dart';
import 'package:islami_c16_sum/core/styles/text_styles.dart';
import 'package:islami_c16_sum/ui/screens/home/models/sura.dart';
import 'package:islami_c16_sum/ui/screens/home/tabs/quran_tab/sura_card.dart';
import 'package:islami_c16_sum/ui/widgets/base_tab_body.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    Sura.generateSurasList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTabBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 15),
            child: Text("Suras List", style: TextStyles.largeBodyTextStyle()),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context , index) => SuraCard(sura: Sura.suras[index]),
              separatorBuilder:
                  (_, _) => Divider(
                    indent: 40,
                    endIndent: 40,
                    color: AppColors.white,
                  ),
              itemCount: Sura.suras.length,
            ),
          ),
        ],
      ),
    );
  }
}
