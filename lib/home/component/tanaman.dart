import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/detail_tanaman.dart';
import 'package:santan/home/component/lihat_semua_tanaman.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/admin/login/login.dart';
import 'package:santan/config/service/api_service.dart';
import '../../widget/search.dart';


class TanamanPage extends StatefulWidget {
  const TanamanPage({Key? key}) : super(key: key);

  @override
  _TanamanPageState createState() => _TanamanPageState();
}

class _TanamanPageState extends State<TanamanPage> {
  String _searchQuery = '';
  List<Plant> _plants = [];

  @override
  void initState() {
    super.initState();
    _fetchPlants();
  }

  Future<void> _fetchPlants() async {
    try {
      List<Plant> plants = await ApiService.getAllPlant();
      plants.sort((a, b) => a.name!.compareTo(b.name!));

      if (_searchQuery.isNotEmpty) {
        plants = plants
            .where((plant) =>
            plant.name!.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
      }

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
                  child: PlantSearchForm(
                    hintText: 'Cari Tanaman...',
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                        _fetchPlants();
                      });
                    },
                    onClearPressed: () {
                      setState(() {
                        _searchQuery = '';
                        _fetchPlants();
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FormLogin(),
                      ),
                    );
                  },
                  icon: const Icon(
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
                  "Tanaman",
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
            child: _plants.isEmpty
                ? Center(
              child: Text(
                "Tanaman tidak ditemukan.",
                style: AppFont.hari,
              ),
            )
                : ListView.builder(
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
