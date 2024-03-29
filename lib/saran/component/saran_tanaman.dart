import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/saran/component/saran_data.dart';
import 'package:santan/utils/extension/extension.dart';
import '../../config/service/api_service.dart';
import '../../data/src/img_string.dart';

import 'lihat_selengkapnya.dart';

class SaranTanaman extends StatefulWidget {
  const SaranTanaman({Key? key, required this.saranTanaman}) : super(key: key);
  final List<Plant> saranTanaman;
  @override
  State<SaranTanaman> createState() => _SaranTanamanState();
}

class _SaranTanamanState extends State<SaranTanaman> {
  List<Plant> _plants = [];

  @override
  void initState() {
    super.initState();
    _plants = widget.saranTanaman;
    _sortPlantsAlphabetically();
    _loadSaranData();
  }

  void _sortPlantsAlphabetically() {
    _plants.sort((a, b) => a.name?.compareTo(b.name ?? '') ?? 0);
  }

  final SaranData saranData = SaranData();

  Future<void> _loadSaranData() async {
    await saranData.prosesHitungSaran();
    bool isKemarau = saranData.isKemarau();
    setState(() {});
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.hari,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          margin: EdgeInsets.all(AppDimen.h4,),
                          padding: EdgeInsets.symmetric(horizontal: AppDimen.w8,),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                plant.name ?? '',
                                style: AppFont.hari,
                              ),
                              Text(
                                "Waktu yang tepat untuk menanam adalah musim : ${saranData.isKemarau() ? 'Kemarau' : 'Hujan'}",
                                style: AppFont.detail,
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Lihat Selengkapnya",
                                  style: AppFont.lihat,
                                ),
                                onTap: () {
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
                              ),
                            ],
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
