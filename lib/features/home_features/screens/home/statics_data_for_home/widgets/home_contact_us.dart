import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsForHome extends StatelessWidget {
  const ContactUsForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              HomeCubit.get(context).isArabic ? "تواصل معنا" : 'Contact us',
              style: TextStyles.font20BlackBold
            ),
           const Spacer(),
            TextButton(
                onPressed: () {
                  context.pushNamed(Routes.contactUsScreen);
                },
                child: Text(
                  HomeCubit.get(context).isArabic ? 'المزيد' : "More",
                  style: TextStyles.font16MainRed,
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
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
                        HomeCubit.get(context).isArabic ? "العنوان" : "Address",
                        style: TextStyles.font16MainRed,
                      ),
                      Text(
                        HomeCubit.get(context).isArabic
                            ? "الإمارات"
                            : "The UAE",
                        style: TextStyles.font13BlackBold,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
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
                        HomeCubit.get(context).isArabic ? "الهاتف" : "Phone",
                        style: TextStyles.font16MainRed,
                      ),
                      Text(
                        HomeCubit.get(context).isArabic
                            ? "+971507877242"
                            : "+971507877242",
                        style: TextStyles.font13BlackBold,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Row(
            children: [
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.message,
                    color: ColorsManager.mainRed,
                  ),
                  horizontalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        HomeCubit.get(context).isArabic
                            ? "البريد الإلكتروني"
                            : "Email Address",
                        style: TextStyles.font16MainRed,
                      ),
                      Text(
                        HomeCubit.get(context).isArabic
                            ? "info@boyo3.com"
                            : "info@boyo3.com",
                        style: TextStyles.font13BlackBold,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Row(
            children: [
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.calendar,
                    color: ColorsManager.mainRed,
                  ),
                  horizontalSpace(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        HomeCubit.get(context).isArabic ? "التوقيت" : "Timing",
                        style: TextStyles.font16MainRed,
                      ),
                      Text(
                        HomeCubit.get(context).isArabic
                            ? "من الاثنين - الجمعة 12م - 12ص"
                            : "من الاثنين - الجمعة 12م - 12ص",
                        style: TextStyles.font13BlackBold,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
