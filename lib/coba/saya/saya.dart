import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/utils/extension/extension.dart';

import '../../config/theme/app_dimen.dart';

class Saya extends StatelessWidget {
  const Saya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.orange,
            child: const Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: ListTile(
                title: Text(
                  "Zainullah",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "087******247",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.face,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.notifications_none_outlined,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          10.0.height,
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimen.w12,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppDimen.h8),
                      width: double.infinity,
                      height: 720.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                              0.5,
                            ),
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Profile Saya"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Keamanan Akun"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("e-Stateent"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Pengaturan Limit dan Pembayaran"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Pengaturan BI-FAST"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Pengaturan Umum"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Undang Teman"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Pusat Bantuan"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Chat dengan SeaBank"),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.account_box,
                                  size: 20,
                                ),
                                10.0.width,
                                const Text("Beri Masukan"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.0.height,
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                              0.5,
                            ),
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.orange,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    10.0.height,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
