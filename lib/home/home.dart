import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/home/component/tanaman.dart';
import 'component/cuaca.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColor.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TanamanPage(),
            CuacaPage(),
          ],
        ),
      ),
    );
  }
}
