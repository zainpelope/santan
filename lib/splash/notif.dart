import 'package:flutter/material.dart';
import 'package:santan/home/home.dart';
import '../config/theme/app_color.dart';
import '../admin/login/login.dart';

class AdminNotification extends StatelessWidget {
  const AdminNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: AlertDialog(
        backgroundColor: AppColor.bg,
        title: const Text(
          "Apakah Anda Admin?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Iya"),
            onPressed: () {
              // admin
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormLogin(),
                ),
              );
            },
          ),
          TextButton(
            child: const Text("Tidak"),
            onPressed: () {
              // bukan admin
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
