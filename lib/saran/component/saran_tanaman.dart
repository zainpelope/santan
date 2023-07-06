import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/model/model_tanaman.dart';
import '../../data/model/cuaca.dart';
import '../../data/src/img_string.dart';
import '../../model/api_tanaman.dart';
import 'lihat_selengkapnya.dart';

class SaranTanaman extends StatefulWidget {
  const SaranTanaman({Key? key}) : super(key: key);

  @override
  State<SaranTanaman> createState() => _SaranTanamanState();
}

class _SaranTanamanState extends State<SaranTanaman> {
  List<Tanaman> tanamanList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final List<Tanaman> data = await ApiService.fetchTanamanData();
    setState(() {
      tanamanList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimen.w6,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: AppDimen.h14,
          ),
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.button,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Prediksi Cuaca Selama 3 Bulan : ${Weather.cuaca[4]}",
                style: AppFont.lihat.copyWith(
                  color: AppColor.teks,
                ),
              ),
              Text(
                "Maka disarankan Untuk Menanam",
                style: AppFont.lihat.copyWith(
                  color: AppColor.teks,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: FutureBuilder<List<Tanaman>>(
            future: ApiService.fetchTanamanData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.green,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Failed to fetch data: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final List<Tanaman> data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
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
                                        data[index].gambar,
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
                                  color: AppColor.hari,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              data[index].nama.toUpperCase(),
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
                                              builder: (context) =>
                                                  LihatSelengkapnya(
                                                    DeskripsiTanaman: data[index]
                                                        .deskripsi,
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
                );
              } else {
                return const Center(
                  child: Text('No data available.'),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
