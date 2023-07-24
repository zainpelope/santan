import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/utils/extension/extension.dart';
import '../../config/service/api_service.dart';
import '../../data/src/img_string.dart';

import 'lihat_selengkapnya.dart';

class SaranTanaman extends StatefulWidget {
  const SaranTanaman({Key? key}) : super(key: key);

  @override
  State<SaranTanaman> createState() => _SaranTanamanState();
}

class _SaranTanamanState extends State<SaranTanaman> {
  List<Plant> _plants = [];

  @override
  void initState() {
    super.initState();
    _fetchPlants();
  }

  Future<void> _fetchPlants() async {
    try {
      List<Plant> plants = await ApiService.getAllPlant();
      setState(() {
        _plants = plants;
      });
    } catch (e) {
      print('Error fetching plants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        4.0.height,
        Expanded(
          child: ListView.builder(
            itemCount: _plants.length,
            itemBuilder: (BuildContext context, int index) {
              Plant plant = _plants[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: AppDimen.w16,
                  right: AppDimen.w16,
                  bottom: AppDimen.h4,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.button,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            4.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  plant.image ?? '',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            4.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.hari,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            width: double.infinity,
                            child: Column(
                              children: [
                                8.0.height,
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        plant.name ?? '',
                                        style: AppFont.hari,
                                      ),
                                      Image.asset(
                                        ImgString.logo,
                                        height: 65,
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LihatSelengkapnya(
                                          DeskripsiTanaman:
                                              plant.description ?? '',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Lihat Selengkapnya",
                                    style: AppFont.lihat,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
