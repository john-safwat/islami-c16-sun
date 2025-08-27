import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_c16_sum/core/assets/app_images.dart';
import 'package:islami_c16_sum/ui/screens/home/home_scree.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.splashBackground,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            right: 0,
            left: 0,
            top: mediaQuery.height * 0.06,
            child: ZoomIn(child: Image.asset(AppImages.mosque01)),
          ),
          Positioned(
            right: mediaQuery.width * 0.03,
            top: 0,
            child: ZoomIn(child: Image.asset(AppImages.glow)),
          ),
          Positioned(
            left: 0,
            top: mediaQuery.height * 0.25,
            child: ZoomIn(child: Image.asset(AppImages.shape07)),
          ),
          Positioned(
            right: 0,
            bottom: mediaQuery.height * 0.15,
            child: ZoomIn(child: Image.asset(AppImages.shape04)),
          ),
          Center(child: ZoomIn(child: Image.asset(AppImages.group36))),
          Positioned(
            right: 0,
            left: 0,
            bottom: mediaQuery.height * 0.04,
            child: ZoomIn(child:  Image.asset(AppImages.routeLogo)),
          ),
        ],
      ),
    );
  }
}
