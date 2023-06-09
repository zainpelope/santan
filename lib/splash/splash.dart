import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/data/src/img_string.dart';
import 'package:santan/home/home.dart';
import 'package:santan/utils/extension/extension.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  ImgString.logo,
                ),
              ),
              if (_isLoading)
                const SpinKitWaveSpinner(
                  color: AppColor.hari,
                  size: 100.0,
                  duration: Duration(milliseconds: 2500),
                ),
              40.0.height,
              Text(
                "Temukan Tanaman Yang Tepat Untuk Kebutuhan Anda!",
                style: AppFont.judul,
                textAlign: TextAlign.center,
              ),
              20.0.height,
            ],
          ),
        ),
      ),
    );
  }
}
