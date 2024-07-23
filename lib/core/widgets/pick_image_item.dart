import 'dart:io';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickImage extends StatefulWidget {
  final String? title;
  final File? imageFile;
  final Function()? getGalleryImage;
  final Function()? removeImage;
  PickImage(
      {super.key,
      required this.title,
      required this.imageFile,
      required this.getGalleryImage,
      required this.removeImage});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.imageFile != null
            ? Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 35.0.w,
                    backgroundImage:
                        FileImage(widget.imageFile!),
                    backgroundColor: Colors.transparent,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.removeImage!();
                        });
                      },
                      icon: CircleAvatar(
                        radius: 15.0.w,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        child: const Icon(
                          FontAwesomeIcons.xmark,
                          color: Colors.black,
                          size: 15.0,
                        ),
                      )),
                ],
              )
            : Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                       CircleAvatar(
                        radius: 37.0.w,
                        backgroundColor: Colors.black,

                      ),
                   
                      CircleAvatar(
                        radius: 35.0.w,
                        
                        backgroundImage: const NetworkImage(
                            'https://imgs.search.brave.com/TUrasfW88g2vggVj6QoG-QWb8EkivrgW1Dw-cirY2f8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM0/NTQ4NTA5MC92ZWN0/b3IvY2FyLWljb24t/dmVjdG9yLWNhci1z/aWxob3VldHRlLmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz0z/ZVBVUWN5VDRPTVU1/VzRhbGxwSk1ydERE/ZHNqQ2I3M1RDWEZ3/Yk5kMkVNPQ'),
                        backgroundColor: Colors.transparent,
                      
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.getGalleryImage!();
                        });
                      },
                      icon: CircleAvatar(
                        radius: 15.0.w,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.photo,
                          color: Colors.white,
                          size: 13.0.w,
                        ),
                      )),
                ],
              ),
        verticalSpace(5),
        Text(
          widget.title!,
          style: TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
