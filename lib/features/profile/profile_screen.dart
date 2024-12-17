import 'dart:io';
import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../basic_constants.dart';
import '../../basic_constants.dart';
import '../../basic_constants.dart';
import '../../basic_constants.dart';
import '../../core/helpers/app_regs.dart';
import '../../core/helpers/spacing.dart';
import '../../core/network/api_constants.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../../core/widgets/boyo3_logo.dart';
import '../../core/widgets/pick_image_widget.dart';
import '../../core/widgets/shared_constants.dart';
import '../../utils/dialog_utils.dart';
import '../auth_features/login/widgets/password_validation.dart';
import '../auth_features/register/cubit/register_cubit.dart';
import '../auth_features/register/widgets/location_provider.dart';
import '../basewidget/custom_textfield.dart';
import '../home_features/cubit/home_cubit/home_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'cuibt/profile_cubit.dart';
import 'cuibt/user_cuibt.dart';
import 'delete_cuibt/delete_user_cuibt.dart';
import 'delete_cuibt/delete_user_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.userId});
  final String userId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isVisible = false;
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isAdmin = false;
  File? _imageCover;
  bool obscureText = true;
  bool isLoading = false;

  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageCover = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().fetchUser(userId!); // Fetch user info in initState
  }

  MyLocationProvider myLocationProvider = MyLocationProvider();
  double? latitude = 0;
  double? longitude = 0;
  String textAlert = 'should take a  photo of your profile image';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              const Boyo3AppBarLogo(),
              const SizedBox(
                width: 100,
              ),
              isAdmin == true ? Text("Admin") : Text("User"),
            ],
          ),
        ),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserErrorInfo) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is UserLoadingInfo) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoadedInfo) {
              final user = state.user;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ///image
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: _imageCover == null
                                      ? const CircleAvatar(
                                          radius: 65,
                                          backgroundImage: NetworkImage(
                                              'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg'),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(
                                                    _imageCover!.path,
                                                  ),
                                                  //
                                                ),
                                              )),
                                        )),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Material(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.red,
                                  borderRadius: BorderRadius.circular(16.0),
                                  onTap: _pickImage,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      AppTextFormField(
                        hintText: user['fullName'],
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return HomeCubit.get(context).isArabic
                                ? 'الرجاءادخال الاسم'
                                : "Please enter a valid full name";
                          }
                        },
                        // controller: context.read<ProfileCubit>().fullNameController,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),

                      AppTextFormField(
                        hintText: user['userName'],
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return HomeCubit.get(context).isArabic
                                ? 'الرجاءادخال اسم مستخدم صحيح'
                                : "Please enter a valid username";
                          }
                        },
                        // controller: context.read<ProfileCubit>().usernameController,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),

                      AppTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: user['phoneNumber'],
                        controller: _phoneNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return HomeCubit.get(context).isArabic
                                ? 'الرجاءادخال رقم هاتف صحيح'
                                : "Please enter a valid Phonenumber";
                          }
                        },
                        // controller: context.read<ProfileCubit>().phonenumberController,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),

                      AppTextFormField(
                        hintText: user['email'],
                        controller: _emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter Email Address';
                          }

                          if (!ValidationUtils.isValidEmail(text)) {
                            return 'please enter a valid email';
                          }
                          return null;
                        },
                        // controller: context.read<ProfileCubit>().emailController,
                      ),
                      // const SizedBox(
                      //   height: 16.0,
                      // ),
                      // AppTextFormField(
                      //   controller: _passwordController,
                      //   hintText:
                      //   HomeCubit.get(context).isArabic ? "كلمة المرور الجديدة" : 'New Password',
                      //   isObscureText: isObscureText,
                      //   suffixIcon: GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         isObscureText = !isObscureText;
                      //       });
                      //     },
                      //     child: Icon(
                      //       isObscureText ? Icons.visibility_off : Icons.visibility,
                      //     ),
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return HomeCubit.get(context).isArabic
                      //           ? "الرجاء إدخال كلمة السر الصحيحة"
                      //           : 'Please enter a valid password';
                      //     }
                      //   },
                      // ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       isVisible = !isVisible;
                      //     });
                      //   },
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         HomeCubit.get(context).isArabic
                      //             ? "قوة الباسورد "
                      //             : 'Password validation',
                      //         style: TextStyles.font15MainRed,
                      //       ),
                      //       const Spacer(),
                      //       Icon(
                      //         isVisible != true
                      //             ? Icons.arrow_drop_down
                      //             : Icons.arrow_drop_up,
                      //         color: ColorsManager.mainRed,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      verticalSpace(5),

                      //Visibility(
                      //   visible: isVisible,
                      //   child: PasswordValidations(
                      //     hasLowerCase: hasLowercase,
                      //     hasUpperCase: hasUppercase,
                      //     hasSpecialCharacters: hasSpecialCharacters,
                      //     hasNumber: hasNumber,
                      //     hasMinLength: hasMinLength,
                      //   ),
                      // ),
                      // verticalSpace(15),
                      // FloatingActionButton.extended(
                      //     backgroundColor: Colors.white,
                      //     onPressed: () {
                      //       getUserLocation();
                      //     },
                      //     icon: const Icon(
                      //       IconlyBold.location,
                      //       color: ColorsManager.mainRed,
                      //     ),
                      //     label: Text(
                      //       HomeCubit.get(context).isArabic
                      //           ? "احصل علي موقعي"
                      //           : 'Get My location',
                      //       style: TextStyles.font15MainRed,
                      //     )),
                      // verticalSpace(10),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Text(
                      //           'latitude : ',
                      //           style: TextStyles.font15MainRed,
                      //         ),
                      //         const Spacer(),
                      //         Text(
                      //           latitude.toString(),
                      //           style: TextStyles.font13BlackBold,
                      //         ),
                      //       ],
                      //     ),
                      //     verticalSpace(3),
                      //     Row(
                      //       children: [
                      //         Text(
                      //           'longitude : ',
                      //           style: TextStyles.font15MainRed,
                      //         ),
                      //         const Spacer(),
                      //         Text(
                      //           longitude.toString(),
                      //           style: TextStyles.font13BlackBold,
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),

                      ///save button
                      BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                          if (state is ProfileUpdateError) {
                            Constants.showToast(
                                msg: state.error,
                                gravity: ToastGravity.BOTTOM,
                                color: Colors.red);
                          } else if (state is ProfileUpdated) {
                            Constants.showToast(
                                msg: state.message,
                                gravity: ToastGravity.BOTTOM,
                                color: Colors.green);
                            context.pop();
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                backgroundColor: ColorsManager.mainRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                              ),
                              //icon: const Icon(Icons.save_as_rounded),
                              child: Text(
                                HomeCubit.get(context).isArabic
                                    ? "تحديث"
                                    : 'Update',
                                style: TextStyles.font16WhiteSemiBold,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<ProfileCubit>(context)
                                      .updateProfile(
                                    id: userId!, // Replace with the actual ID
                                    fullName: _fullNameController.text,
                                    username: _usernameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    phoneNumber: _phoneNumberController.text,
                                    isAdmin: _isAdmin,
                                    imageCover: _imageCover,
                                  );
                                }
                                // userId == null ||userId == ""
                                //     ? Constants.showErrorDialog(
                                //     context: context,
                                //     msg:
                                //     "يجب تسجيل الدخول لتحديث البيانات ")
                                //     : context.read<ProfileCubit>().imageCover == null ||
                                //     context.read<ProfileCubit>().fullNameController.text.isEmpty||
                                //     context.read<ProfileCubit>().usernameController.text.isEmpty||
                                //     context.read<ProfileCubit>().emailController.text.isEmpty||
                                //     context.read<ProfileCubit>().passwordController.text.isEmpty||
                                //     context.read<ProfileCubit>().phonenumberController.text.isEmpty||
                                //     context.read<ProfileCubit>().longitude == null||
                                //     context.read<ProfileCubit>().latitude == null
                                //     ? Constants.showErrorDialog(
                                //     context: context,
                                //     msg: "من فضلك قم بادخال البيانات الصحيحة اولا ")
                                //     : validateThenUpdateProfile(context);
                              },
                            ),
                          );
                        },

                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      BlocConsumer<DeleteUserCubit, DeleteUserState>(
                        listener: (context, state) {
                          if (state is DeleteUserSuccess) {

                            Constants.showToast(
                                msg: 'Account deleted successfully',
                                gravity: ToastGravity.BOTTOM,
                                color: Colors.green);
                            Navigator.of(context).pop();  // Navigate after deletion
                          } else if (state is DeleteUserFailure) {

                            Constants.showToast(
                                msg: state.error,
                                gravity: ToastGravity.BOTTOM,
                                color: Colors.red);
                          }
                        },
                        builder: (context, state) {

                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                backgroundColor: ColorsManager.mainRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                              ),
                              //icon: const Icon(Icons.save_as_rounded),
                              child: Text(
                                HomeCubit.get(context).isArabic
                                    ? "حذف الحساب"
                                    : 'Delete Account',
                                style: TextStyles.font16WhiteSemiBold,
                              ),
                              onPressed: () async {
                                DialogUtils.showMessage(
                                    context,
                                    HomeCubit.get(context).isArabic
                                        ? 'هل أنت متأكد من حذف الحساب؟'
                                        : 'Are you sure you want to delete your account?',
                                    posActionTitle:
                                    HomeCubit.get(context).isArabic
                                        ? "نعم"
                                        : "yes",
                                    posAction: () async {
                                      context.read<DeleteUserCubit>().deleteUser(userId!);
                                  var prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    isSignIn = false;
                                    userId=null;
                                    userToken=null;

                                  });
                                  prefs.setBool('isAuth', false);
                                  prefs.remove('userId');
                                  prefs.remove('token');
                                  context
                                      .pushReplacementNamed(Routes.loginScreen);
                                },
                                    negActionTitle:
                                    HomeCubit.get(context).isArabic
                                        ? "لا"
                                        : "no",
                                    negAction: () {});

                              },
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is UserErrorInfo) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }

  // void validateThenUpdateProfile(BuildContext context) {
  //
  //   if (context.read<ProfileCubit>().formKey.currentState!.validate()) {
  //     // Ensure all controllers are not null
  //     if (context.read<ProfileCubit>().fullNameController.text.isNotEmpty &&
  //         context.read<ProfileCubit>().usernameController.text.isNotEmpty &&
  //         context.read<ProfileCubit>().emailController.text.isNotEmpty &&
  //         context.read<ProfileCubit>().phonenumberController.text.isNotEmpty &&
  //         context.read<ProfileCubit>().passwordController.text.isNotEmpty) {
  //
  //       // final updatedProfile = Profile(
  //       //   id: userId,
  //       //   fullName: context.read<ProfileCubit>().fullNameController.text,
  //       //   username: context.read<ProfileCubit>().usernameController.text,
  //       //   email: context.read<ProfileCubit>().emailController.text,
  //       //   phone: context.read<ProfileCubit>().phonenumberController.text,
  //       //   password: context.read<ProfileCubit>().passwordController.text,
  //       //   imageUrl: context.read<ProfileCubit>().imageCover, // Ensure profile is not null
  //       // );
  //
  //       context.read<ProfileCubit>().updateProfileState();
  //       Constants.showToast(msg: "تم التحديث بنجاح");
  //     } else {
  //       // Handle empty fields or show an error message
  //     }
  //   }
  //
  // }
  // void getUserLocation() async {
  //   var locationData = await myLocationProvider.getLocation();
  //   context.read<ProfileCubit>().latitude = locationData!.latitude;
  //   context.read<ProfileCubit>().longitude = locationData.longitude;
  //   setState(() {
  //     latitude = context.read<ProfileCubit>().latitude;
  //     longitude = context.read<ProfileCubit>().longitude;
  //   });
  //   Constants.showToast(msg: "تم أخذ الموقع بنجاح");
  // }

  // final ImagePicker picker = ImagePicker();
  // String coverImageUrl = '';
  // XFile? coverImage;
  // File? coverImageFile;
  //
  //
  // Future<void> getGalleryCoverImage() async {
  //   coverImage = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (coverImage != null) {
  //     setState(() {
  //       context.read<ProfileCubit>().imageCover = File(coverImage!.path);
  //       textAlert = '';
  //     });
  //   } else {}
  // }
  //
  // Future<void> getCameraCoverImage() async {
  //   coverImage = await picker.pickImage(
  //     source: ImageSource.camera,
  //   );
  //   if (coverImage != null) {
  //     setState(() {
  //       context.read<ProfileCubit>().imageCover = File(coverImage!.path);
  //       textAlert = '';
  //     });
  //   } else {}
  // }
  //
  // void removeCoverImage() {
  //   setState(() {
  //     context.read<ProfileCubit>().imageCover = null;
  //
  //   });
  // }
}
