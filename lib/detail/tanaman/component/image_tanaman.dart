import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageTanaman extends StatelessWidget {
  const ImageTanaman({Key? key, required this.GambarTanaman}) : super(key: key);
  final String GambarTanaman;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            GambarTanaman,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
