import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/splash/splash.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'home/home.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Saran Tanaman',
          //home: HomePage(),
          home: SplashScreenPage(),
        );
      },
    );
  }
}
