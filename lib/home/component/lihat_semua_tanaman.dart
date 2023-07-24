import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/detail_tanaman.dart';
import 'package:santan/model/api_tanaman.dart';
import 'package:santan/model/model_tanaman.dart';

class SemuaTanaman extends StatefulWidget {
  const SemuaTanaman({Key? key}) : super(key: key);

  @override
  State<SemuaTanaman> createState() => _SemuaTanamanState();
}

class _SemuaTanamanState extends State<SemuaTanaman> {
  List<Tanaman> tanamanList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final List<Tanaman> data = await ApiService.getAllPlant();
    setState(() {
      tanamanList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.green,
        title: Text(
          "Semua Tanaman",
          style: AppFont.judul,
        ),
        elevation: 3,
      ),
      body: FutureBuilder<List<Tanaman>>(
        future: ApiService.getAllPlant(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.hari,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Periksa Koneksi Anda!',
                style: AppFont.hari.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            final List<Tanaman> data = snapshot.data!;
            return GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
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
                  child: Card(
                    color: AppColor.hari,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: AppDimen.h2,
                              right: AppDimen.w2,
                              left: AppDimen.w2,
                              bottom: AppDimen.h4,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  data[index].gambar,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          data[index].nama,
                          style: AppFont.hari,
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
