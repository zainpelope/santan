import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/home/home.dart';
import 'package:santan/utils/extension/extension.dart';
import 'package:santan/widget/app_button.dart';
import '../../config/theme/app_color.dart';
import '../../config/theme/app_dimen.dart';
import '../menu/menu.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hari,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimen.w30,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.bg,
                      hintText: 'Username',
                      hintStyle: AppFont.form,
                      suffixIcon: const Icon(
                        Icons.perm_identity,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                  ),
                  12.0.height,
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.bg,
                      hintText: 'Password',
                      hintStyle: AppFont.form,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                    obscureText: !_passwordVisible,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'Remember Login',
                        style: AppFont.desc.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  AppButton(
                    text: 'Login',
                    onPressed: _isChecked ? _login : null,
                    warna: AppColor.green,
                    height: 45.0.h,
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Jika anda bukan admin, ",
                style: AppFont.desc,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "klik disini ",
                    style: AppFont.desc.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  "untuk masuk kehalaman utama",
                  style: AppFont.desc,
                ),
              ],
            ),
            10.0.height,
          ],
        ),
      ),
    );
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'admin') {
      _showSnackBar('Login berhasil');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MenuAdmin(),
        ),
      );
    } else {
      _showSnackBar('Username atau password salah');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
