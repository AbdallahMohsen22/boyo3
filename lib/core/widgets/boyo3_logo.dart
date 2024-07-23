import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Boyo3Logo extends StatelessWidget {
  const Boyo3Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Image.asset('assets/images/bio3Icon.png',
                           width: 200.w,
                           height: 150.h,
                         ),
        const Spacer(),
      ],
    );
  }
}
class Boyo3AppBarLogo extends StatelessWidget {
  const Boyo3AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      //D:\flutter_apps\boyo3_v1\assets\images\bio3EnIcon.png
      "assets/images/bio3Icon.png",
      height: 60.h,
      width: 70.w,
    );
  
  }
}

