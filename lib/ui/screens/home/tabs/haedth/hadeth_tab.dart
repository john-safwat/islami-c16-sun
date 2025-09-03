import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c16_sum/ui/screens/home/models/hadeth.dart';
import 'package:islami_c16_sum/ui/screens/home/tabs/haedth/hadeth_card.dart';
import 'package:islami_c16_sum/ui/widgets/base_tab_body.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahahdeth = [];

  @override
  void initState() {
    super.initState();
    getHadethList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTabBody(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child:
            ahahdeth.isEmpty
                ? Center(child: CircularProgressIndicator())
                : CarouselSlider(
                  items: ahahdeth.map((e) => HadethCard(hadeth: e)).toList(),
                  options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 0.7,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                  ),
                ),
      ),
    );
  }

  Future<void> getHadethList() async {
    var data = await rootBundle.loadString("assets/files/ahadeeth.txt");
    // this list contain all ahadeth from the file
    var ahadethData = data.split("#");
    for (var hadeth in ahadethData) {
      // this list contain all hadeth lines
      var hadethData = hadeth.trim().split("\n");
      // this is hadeth title
      String hadethTitle = hadethData.first;
      // this is the list of lines in hadeth without title
      hadethData = hadethData.sublist(1);
      // this is the hadeth content
      String hadethContent = hadethData.join(" ");
      ahahdeth.add(Hadeth(hadethTitle, hadethContent));
    }
    setState(() {});
  }
}
