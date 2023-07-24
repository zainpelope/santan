import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/home/component/tanaman.dart';
import 'package:santan/utils/extension/extension.dart';

import 'component/cuaca.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //PlantPage(),
            TanamanPage(),
            10.0.height,
            CuacaPage(),
          ],
        ),
      ),
    );
  }
}
