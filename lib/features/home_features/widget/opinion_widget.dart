import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OpinionsWidget extends StatelessWidget {
  final String clientName;
  final String clientOpinion;
  OpinionsWidget({super.key , required this.clientName, required this.clientOpinion});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10.0),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.amber,
                      backgroundImage: const NetworkImage('https://imgs.search.brave.com/F2-JuCznDFyTZacItZl1MFz_oVdn6DBVaT6OBkGRA7o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAxLzI2LzYxLzEz/LzM2MF9GXzEyNjYx/MTMzN19tOGtjUnRT/NUc3QWhyRnBPUTBX/dWZ4NFBnTDZKNHl4/Zy5qcGc'),
                      radius: 25.0.w
                  ),
                  horizontalSpace(20),
                  Column(
                    children: [
                      verticalSpace(15),
                      Center(
                        child: Text(
                          clientName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.font18BlackBold
                        ),
                      ),


                    ],
                  ),

                ],
              ),
            ),
            verticalSpace(20),

            ///size with unit
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        clientOpinion,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyles.font16BlackBold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(15),


          ],
        ),
      ),
    );
  }
}
