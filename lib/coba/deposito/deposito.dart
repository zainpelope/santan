import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santan/utils/extension/extension.dart';

class Deposito extends StatelessWidget {
  const Deposito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Deposito"),
            Icon(
              Icons.notifications_none_outlined,
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              color: Colors.orange, // Ganti dengan warna yang diinginkan
            ),
            child: const ListTile(
              trailing: Icon(
                Icons.child_care,
                size: 100,
                color: Colors.white60,
              ),
              title: Text(
                "Nikmati bunga\nhingga 6% p.a",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Raih keuntungan lebih dari uang kamu sekarang!",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              top: 20.0,
              bottom: 16,
            ),
            child: Text("Produk Favorit"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(
                    0.4,
                  ),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(
                          70,
                        ),
                      )),
                  child: const Center(
                      child: Text(
                    "Rekomendasi",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6,left: 14,),
                  child: Row(
                    children: [
                      Text(
                        "Mulai dari",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87
                        ),
                      ),
                      4.0.width,
                      Text(
                        "Rp 1.000.000",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("data")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
