import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/detail_tanaman.dart';
import 'package:santan/home/component/lihat_semua_tanaman.dart';
import 'package:santan/model/model_tanaman.dart';
import 'package:santan/models/tanaman/plant.dart';

import '../../admin/login/login.dart';
import '../../config/service/api_service.dart';

class TanamanPage extends StatefulWidget {
  const TanamanPage({Key? key}) : super(key: key);

  @override
  _TanamanPageState createState() => _TanamanPageState();
}

class _TanamanPageState extends State<TanamanPage> {
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
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.hari,
                      hintText: 'Cari Tanaman',
                      hintStyle: AppFont.pencarian,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormLogin(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimen.h16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jenis Tanaman",
                  style: AppFont.hari,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SemuaTanaman(),
                      ),
                    );
                  },
                  child: Text(
                    "Lihat Semua",
                    style: AppFont.lihat,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 345.0.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _plants.length,
              itemBuilder: (context, index) {
                Plant plant = _plants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTanaman(
                          namePlant: plant.name ?? '',
                          imagePlant: plant.image ?? '',
                          descriptionPlant: plant.description ?? '',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimen.w4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.hari,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    width: 220.0.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: AppDimen.h4,
                            left: AppDimen.w4,
                            right: AppDimen.w4,
                          ),
                          height: 300.0.h,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                plant.image ?? '',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0.h),
                        Text(
                          plant.name ?? '',
                          style: AppFont.hari,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
