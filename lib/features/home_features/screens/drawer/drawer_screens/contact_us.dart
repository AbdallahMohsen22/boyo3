import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(HomeCubit.get(context).isArabic ? "تواصل معنا" : "Contact us"),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Boyo3Logo(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.house,
                            color: ColorsManager.mainRed,
                          ),
                          horizontalSpace(10),
                          Column(
                            children: [
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "العنوان"
                                      : "Address",
                                  style: TextStyles.font15MainRed),
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "الإمارات"
                                      : "The UAE",
                                  style: TextStyles.font13BlackBold),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.phone,
                            color: ColorsManager.mainRed,
                          ),
                          horizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "الهاتف"
                                      : "Phone",
                                  style: TextStyles.font15MainRed),
                              Text(
                                  //+971 50 787 7242
                                  HomeCubit.get(context).isArabic
                                      ? "+971507877242"
                                      : "+971507877242",
                                  style: TextStyles.font13BlackBold),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.message,
                              color: ColorsManager.mainRed),
                          horizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "البريد الإلكتروني"
                                      : "Email Address",
                                  style: TextStyles.font15MainRed),
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "info@boyo3.com"
                                      : "info@boyo3.com",
                                  style: TextStyles.font13BlackBold),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.calendar,
                            color: ColorsManager.mainRed,
                          ),
                          horizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "التوقيت"
                                      : "Timing",
                                  style: TextStyles.font15MainRed),
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "من الاثنين - الجمعة 12م - 12ص"
                                      : "من الاثنين - الجمعة 12م - 12ص",
                                  style: TextStyles.font13BlackBold),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
