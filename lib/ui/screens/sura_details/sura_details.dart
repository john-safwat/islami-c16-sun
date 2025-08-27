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
              : Center(
                child: Text(
                  suraContent!,
                  style: TextStyles.largeBodyTextStyle(),
                ),
              ),
    );
  }

  Future<void> loadSuraDetails() async {
    var sura = await rootBundle.loadString(
      "assets/files/${widget.sura.id}.txt",
    );
    var ayas = sura.split("\n");
    String formatedSura = " ";


    for (int i = 0; i < ayas.length; i++) {
      formatedSura = "$formatedSura[${i + 1}]${ayas[i].trim()} ";
    }
    suraContent = formatedSura;
    setState(() {

    });
  }
}
