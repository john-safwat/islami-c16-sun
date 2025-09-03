import 'package:flutter/material.dart';
import 'package:islami_c16_sum/ui/screens/home/home_scree.dart';
import 'package:islami_c16_sum/ui/screens/home/models/sura.dart';
import 'package:islami_c16_sum/ui/screens/splash/splash_screen.dart';
import 'package:islami_c16_sum/ui/screens/sura_details/sura_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (context) {
          var sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetails(sura: sura,);
        },
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
