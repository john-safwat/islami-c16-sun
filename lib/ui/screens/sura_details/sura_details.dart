import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c16_sum/core/styles/app_colors.dart';
import 'package:islami_c16_sum/core/styles/text_styles.dart';
import 'package:islami_c16_sum/ui/screens/home/models/sura.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";
  final Sura sura;

  SuraDetails({required this.sura, super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String? suraContent;

  @override
  Widget build(BuildContext context) {
    if (suraContent == null) {
      loadSuraDetails();
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(widget.sura.nameEn),
      ),
      body:
          suraContent == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Image.asset(AppImages.imgLeftCorner),
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,

                            child: Text(
                              widget.sura.nameAr,
                              style: TextStyles.largeLabelTextStyle(
                                textColor: AppColors.gold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Image.asset(AppImages.imgRightCorner),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          suraContent!,
                          style: TextStyles.largeBodyTextStyle(
                            textColor: AppColors.gold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(AppImages.imgBottomDecoration),
                ],
              ),
    );
  }

  Future<void> loadSuraDetails() async {
    var sura = await rootBundle.loadString(
      "assets/files/${widget.sura.id}.txt",
    );
    var ayas = sura.trim().split("\n");
    String formatedSura = " ";


    for (int i = 0; i < ayas.length; i++) {
      formatedSura = " $formatedSura[${i + 1}] ${ayas[i].trim()} ";
    }
    suraContent = formatedSura;
    setState(() {

    });
  }
}
