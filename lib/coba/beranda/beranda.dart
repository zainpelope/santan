import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/utils/extension/extension.dart';

import '../../config/theme/app_dimen.dart';

class Beranda extends StatelessWidget {
  final List<String> images = [
    'https://cdn-2.tstatic.net/kaltim/foto/bank/images/20230623_Upin-Ipin_Link-Nonton-MNC-TV_Bermula-Anak-Harimau-Kembali-Lagi.jpg',
    'https://cdn-2.tstatic.net/kaltim/foto/bank/images/20230623_Upin-Ipin_Link-Nonton-MNC-TV_Bermula-Anak-Harimau-Kembali-Lagi.jpg',
    'https://cdn-2.tstatic.net/kaltim/foto/bank/images/20230623_Upin-Ipin_Link-Nonton-MNC-TV_Bermula-Anak-Harimau-Kembali-Lagi.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                "Zainullah",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              subtitle: Row(
                children: [
                  const Text(
                    "No. Rekening: 9013 0920 4115",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                  4.0.width,
                  const Icon(
                    Icons.copy,
                    size: 14,
                    color: Colors.black87,
                  ),
                ],
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.face,
                  size: 40,
                  color: Colors.black87,
                ),
              ),
              trailing: const Icon(
                Icons.notifications_none_outlined,
                size: 32,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimen.w12,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          AppDimen.w8,
                        ),
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            AppDimen.w10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Saldo Tersedia",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white60,
                                    ),
                                  ),
                                  6.0.width,
                                  const Icon(
                                    Icons.visibility_outlined,
                                    size: 14,
                                    color: Colors.white60,
                                  ),
                                ],
                              ),
                              //20.0.height,
                              Row(
                                children: [
                                  const Text(
                                    "Rp",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  4.0.width,
                                  const Text(
                                    "0",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              //20.0.height,
                              const Divider(
                                color: Colors.white60,
                              ),
                              //20.0.height,
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Pendapatan Bunga",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white60,
                                            ),
                                          ),
                                          6.0.width,
                                          const Icon(
                                            Icons.error_outline_outlined,
                                            size: 14,
                                            color: Colors.white60,
                                          ),
                                        ],
                                      ),
                                      4.0.height,
                                      const Text(
                                        "Rp 13.315",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  60.0.width,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Suku Bunga",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white60,
                                            ),
                                          ),
                                          6.0.width,
                                          const Icon(
                                            Icons.error_outline_outlined,
                                            size: 14,
                                            color: Colors.white60,
                                          ),
                                        ],
                                      ),
                                      4.0.height,
                                      const Text(
                                        "4% p.a",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      10.0.height,
                      Container(
                        padding: EdgeInsets.all(AppDimen.h8),
                        width: double.infinity,
                        height: 180.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.2,
                              ),
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: GridView.count(
                          crossAxisCount: 4,
                          children: const [
                            MenuItem(icon: Icons.home, title: 'Transfer'),
                            MenuItem(
                                icon: Icons.favorite, title: 'Pulsa & Tagihan'),
                            MenuItem(
                                icon: Icons.settings, title: 'Top Up E-Wallet'),
                            MenuItem(
                                icon: Icons.person, title: 'Riwayat Transaksi'),
                            MenuItem(icon: Icons.home, title: 'Deposito'),
                            MenuItem(
                                icon: Icons.favorite, title: 'Undang Teman'),
                            MenuItem(
                                icon: Icons.settings,
                                title: 'SPinjam by Shopee'),
                            MenuItem(icon: Icons.person, title: 'Tambah Saldo'),
                          ],
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 200),
                          viewportFraction: 0.8,
                        ),
                        items: images.map(
                          (item) {
                            return Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      10.0.height,
                      Container(
                        padding: EdgeInsets.all(AppDimen.h8),
                        width: double.infinity,
                        height: 330.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.2,
                              ),
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Riwayat Transaksi"),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const ListTile(
                              title: Text("Zainullah"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transfer",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    "24 Jun 2023, 18:58",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.tag_faces_sharp,
                                  size: 30,
                                ),
                              ),
                              trailing: Text(
                                "-Rp 2.378.993",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const ListTile(
                              title: Text("Zainullah"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transfer",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    "24 Jun 2023, 18:58",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.tag_faces_sharp,
                                  size: 30,
                                ),
                              ),
                              trailing: Text(
                                "+Rp 2.378.993",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const ListTile(
                              title: Text("Zainullah"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transfer",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    "24 Jun 2023, 18:58",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.tag_faces_sharp,
                                  size: 30,
                                ),
                              ),
                              trailing: Text(
                                "-Rp 2.378.993",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            4.0.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Transaksi Lainnya",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                4.0.width,
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      10.0.height,
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "BUNGA TABUNGAN",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.request_page_outlined,
                                          size: 50,
                                          color: Colors.orange,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "4%",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              height: 15,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  4,
                                                ),
                                              ),
                                              child: const Center(
                                                  child: Text(
                                                "CAIR SETIAP HARI",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.yellow,
                                                ),
                                              )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "BUNGA DEPOSITO",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.request_page_outlined,
                                          size: 50,
                                          color: Colors.blue,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "6%",
                                              style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              height: 15,
                                              width: 95,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  4,
                                                ),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "JATUH TEMPO 3 BULAN",
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.0.height,
                      Container(
                        padding: EdgeInsets.all(AppDimen.h8),
                        width: double.infinity,
                        height: 330.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.2,
                              ),
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Transaksi Terakhir"),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const ListTile(
                              title: Text("Zainullah"),
                              subtitle: Text(
                                "BTN : 353287462397235468",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.tag_faces_sharp,
                                  size: 30,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const ListTile(
                              title: Text("Zainullah"),
                              subtitle: Text(
                                "NEO COMMERCE : 8674592763405246",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.tag_faces_sharp,
                                  size: 30,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const ListTile(
                              title: Text("Danaid 087882947247"),
                              subtitle: Text(
                                "Dana : 087882947247",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.featured_video,
                                  size: 30,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            4.0.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Transaksi Lainnya",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                4.0.width,
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      10.0.height,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("saya ditekan");
      },
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.orange,
          ),
          const SizedBox(height: 6.0),
          Text(
            title,
            style: const TextStyle(color: Colors.orange, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
