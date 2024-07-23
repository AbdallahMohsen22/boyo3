import 'dart:io';

import 'package:boyo3_v1/core/helpers/app_regs.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/password_validation.dart';
import 'package:boyo3_v1/features/auth_features/register/cubit/register_cubit.dart';
import 'package:boyo3_v1/features/auth_features/register/widgets/location_provider.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
    bool isVisible = false;

 bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
  MyLocationProvider myLocationProvider = MyLocationProvider();
  double? latitude = 0;
  double? longitude = 0;
  String textAlert = 'should take a  photo of your profile image';

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: context.read<RegisterCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //profile
          context.read<RegisterCubit>().imageCover != null
              ? Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 40.0.w,
                      backgroundImage:
                          //productImageFile != null?
                          FileImage(context.read<RegisterCubit>().imageCover!),
                      backgroundColor: Colors.transparent,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            removeCoverImage();
                          });
                        },
                        icon: CircleAvatar(
                          radius: 15.0.w,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            size: 13.0,
                          ),
                        )),
                  ],
                )
              : Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 40.0.w,
                      backgroundImage: NetworkImage(
                          'https://www.uochb.cz/user-photo/default.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            getGalleryCoverImage();
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
          verticalSpace(15),
          Text(
            textAlert,
            style: TextStyles.font15MainRed,
          ),
          //name
          AppTextFormField(
            hintText:
                HomeCubit.get(context).isArabic ? "الاسم بالكامل" : 'Full name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return HomeCubit.get(context).isArabic
                    ? 'الرجاءادخال الاسم'
                    : "Please enter a valid full name";
              }
            },
            controller: context.read<RegisterCubit>().fullNameController,
          ),
          verticalSpace(15),
          //username
          AppTextFormField(
            hintText:
                HomeCubit.get(context).isArabic ? "اسم المستخدم" : 'Username',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return HomeCubit.get(context).isArabic
                    ? 'الرجاءادخال اسم مستخدم صحيح'
                    : "Please enter a valid username";
              }
            },
            controller: context.read<RegisterCubit>().usernameController,
          ),
          verticalSpace(15),
          AppTextFormField(
            keyboardType: TextInputType.number,
            hintText:
                HomeCubit.get(context).isArabic ? "رقم الهاتف" : 'Phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return HomeCubit.get(context).isArabic
                    ? 'الرجاءادخال رقم هاتف صحيح'
                    : "Please enter a valid Phonenumber";
              }
            },
            controller: context.read<RegisterCubit>().phonenumberController,
          ),
          verticalSpace(15),
          //email
          // AppTextFormField(
          //   hintText:
          //       HomeCubit.get(context).isArabic ? "البريد الالكتروني" : 'Email',
          //   validator: (text) {
          //     if (text == null || text.trim().isEmpty) {
          //       return 'please enter Email Address';
          //     }
          //
          //     if (!ValidationUtils.isValidEmail(text)) {
          //       return 'please enter a valid email';
          //     }
          //     return null;
          //   },
          //   controller: context.read<RegisterCubit>().emailController,
          // ),
          verticalSpace(15),
          //password
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            hintText:
                HomeCubit.get(context).isArabic ? "كلمة المرور" : 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return HomeCubit.get(context).isArabic
                    ? "الرجاء إدخال كلمة السر الصحيحة"
                    : 'Please enter a valid password';
              }
            },
          ),

          verticalSpace(10),
          InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Row(
              children: [
                Text(
                  HomeCubit.get(context).isArabic?
                  "قوة الباسورد ":'Password validation',
                  style: TextStyles.font15MainRed,
                ),
                Spacer(),
                Icon(
                  isVisible!=true? Icons.arrow_drop_down:Icons.arrow_drop_up,
                  color: ColorsManager.mainRed,
                )
              ],
            ),
          ),
          verticalSpace(5),

          Visibility(
            visible: isVisible,
            child: PasswordValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ),
          verticalSpace(15),

          verticalSpace(15),
          FloatingActionButton.extended(
              backgroundColor: Colors.white,
              onPressed: () {
                getUserLocation();
              },
              icon: const Icon(
                IconlyBold.location,
                color: ColorsManager.mainRed,
              ),
              label: Text(
                HomeCubit.get(context).isArabic
                    ? "احصل علي موقعي"
                    : 'Get My location',
                style: TextStyles.font15MainRed,
              )),
          verticalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'latitude : ',
                    style: TextStyles.font15MainRed,
                  ),
                  const Spacer(),
                  Text(
                    latitude.toString(),
                    style: TextStyles.font13BlackBold,
                  ),
                ],
              ),
              verticalSpace(3),
              Row(
                children: [
                  Text(
                    'longitude : ',
                    style: TextStyles.font15MainRed,
                  ),
                  const Spacer(),
                  Text(
                    longitude.toString(),
                    style: TextStyles.font13BlackBold,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  void getUserLocation() async {
    var locationData = await myLocationProvider.getLocation();
    context.read<RegisterCubit>().latitude = locationData!.latitude;
    context.read<RegisterCubit>().longitude = locationData.longitude;
    setState(() {
      latitude = context.read<RegisterCubit>().latitude;
      longitude = context.read<RegisterCubit>().longitude;
    });
    Constants.showToast(msg: "تم أخذ الموقع بنجاح");
  }

  final ImagePicker picker = ImagePicker();
  String coverImageUrl = '';
  XFile? coverImage;
  File? coverImageFile;
  Future<void> getGalleryCoverImage() async {
    coverImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (coverImage != null) {
      setState(() {
        context.read<RegisterCubit>().imageCover = File(coverImage!.path);
        textAlert = '';
      });
    } else {}
  }

  Future<void> getCameraCoverImage() async {
    coverImage = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (coverImage != null) {
      setState(() {
        context.read<RegisterCubit>().imageCover = File(coverImage!.path);
        textAlert = '';
      });
    } else {}
  }

  void removeCoverImage() {
    setState(() {
      context.read<RegisterCubit>().imageCover = null;
      textAlert = 'should take a  photo of your profile image';
    });
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
