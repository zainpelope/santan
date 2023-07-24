import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/detail_tanaman.dart';
import 'package:santan/home/component/lihat_semua_tanaman.dart';
import 'package:santan/model/model_tanaman.dart';
import '../../model/api_tanaman.dart';

class TanamanPage extends StatefulWidget {
  const TanamanPage({Key? key}) : super(key: key);

  @override
  _TanamanPageState createState() => _TanamanPageState();
}

class _TanamanPageState extends State<TanamanPage> {
  String _searchText = "";
  String _selectedTanaman = "";

  late Future<List<Tanaman>> _fetchData;
  List<Tanaman> _tanamanList = [];

  @override
  void initState() {
    super.initState();
    _fetchData = fetchData();
  }

  Future<List<Tanaman>> fetchData() async {
    final List<Tanaman> data = await ApiService.getAllPlant();
    setState(() {
      _tanamanList = data;
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: AppDimen.h4,
              left: AppDimen.w16,
              right: AppDimen.w16,
            ),
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
              onChanged: (text) {
                setState(() {
                  _searchText = text.toLowerCase();
                });
              },
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
          FutureBuilder<List<Tanaman>>(
            future: _fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: AppColor.hari,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppDimen.h130,),
                    child: Text(
                      'Periksa Koneksi Anda!',
                      style: AppFont.hari.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                final List<Tanaman> data = snapshot.data!;
                return SizedBox(
                  height: 345.0.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      if (data[index]
                          .nama
                          .toLowerCase()
                          .contains(_searchText)) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTanaman = data[index].nama;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTanaman(
                                  NamaTanaman: data[index].nama,
                                  GambarTanaman: data[index].gambar,
                                  DeskripsiTanaman: data[index].deskripsi,
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
                                        data[index].gambar,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.0.h),
                                Text(
                                  data[index].nama,
                                  style: AppFont.hari,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              } else {
                return const Text('No data available');
              }
            },
          ),
          SizedBox(height: 10.0.h),
        ],
      ),
    );
  }
}
