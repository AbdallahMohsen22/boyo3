import 'dart:io';
import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/features/profile/profile_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import '../../basic_constants.dart';
import '../../basic_constants.dart';
import '../../basic_constants.dart';
import '../../basic_constants.dart';
import '../../core/helpers/app_regs.dart';
import '../../core/helpers/spacing.dart';
import '../../core/network/api_constants.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../../core/widgets/boyo3_logo.dart';
import '../../core/widgets/pick_image_widget.dart';
import '../../core/widgets/shared_constants.dart';
import '../auth_features/login/widgets/password_validation.dart';
import '../auth_features/register/cubit/register_cubit.dart';
import '../auth_features/register/widgets/location_provider.dart';
import '../basewidget/custom_textfield.dart';
import '../home_features/cubit/home_cubit/home_cubit.dart';
import 'package:http/http.dart' as http;


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

  late TextEditingController passwordController;
  late final TextEditingController _nameController,
      _emailController,
      _passwordController,
      _phoneController,
      _userNameController;
  late final FocusNode _nameFocusNode,
      _emailFocusNode,
      _phoneFocusNode,
      _userNameFocusNode,
      _passwordFocusNode;
  bool obscureText = true;
  bool isLoading = false;


  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    // Focus Nodes
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _userNameFocusNode = FocusNode();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _userNameController.dispose();
  //   // Focus Nodes
  //   _nameFocusNode.dispose();
  //   _emailFocusNode.dispose();
  //   _passwordFocusNode.dispose();
  //   _userNameFocusNode.dispose();
  //   super.dispose();
  // }


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

  //Api call
  // void updateProfile(BuildContext context) async {
  //   String fullName = _nameController.text.trim();
  //   String userName = _userNameController.text.trim();
  //   String email = _emailController.text.trim();
  //   String password = _passwordController.text.trim();
  //   String phone = _phoneController.text.trim();
  //
  //   // Validate inputs
  //   if (email.isEmpty || password.isEmpty ||fullName.isEmpty||userName.isEmpty||phone.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please complete all fields')),
  //     );
  //     return;
  //   }
  //
  //   var headers = {
  //     ApiConstants.contentTypeTitle: ApiConstants.contentTypeBody,
  //     ApiConstants.tokenTitle: ApiConstants.tokenBody
  //   };
  //   // Request body as JSON
  //   // Map<String, String> body = {
  //   //   'Email':_emailController.text.trim(),
  //   //   'Password': _passwordController.text.trim(),
  //   // };
  //
  //   // Encode body to JSON
  //   // String bodyJson = json.encode(body);
  //
  //   var data = FormData.fromMap({
  //     'FullName': fullName,
  //     'Username': userName,
  //     'Email': email,
  //     'Password': password,
  //     'Phonenumber': phone,
  //     'image': _pickedImage,
  //   });
  //   // Send POST request
  //   var dio = Dio();
  //   try {
  //     print("API Call=====>>>> ");
  //     var response = await dio.request(
  //       '${ApiConstants.baseUrl}${ApiConstants.updateSubProfile}/9ddb91d5-9437-4b9f-8b38-2b2c5b104390',
  //       options: Options(
  //         method: 'PUT',
  //         headers: headers,
  //       ),
  //       data: data,
  //     );
  //
  //     // Check response status
  //     if (response.statusCode == 200) {
  //
  //       Navigator.push(context, MaterialPageRoute(
  //         builder: (context) => const HomeScreen(),));
  //       print("API Response====>>> Profile Updated");
  //       print("API Response====>>> ${response.data}");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Profile updated successfully')),
  //       );
  //     } else {
  //       // Show error message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Update failed')),
  //       );
  //       print("API Response====>>>${response.statusCode}");
  //     }
  //   } catch (e) {
  //     // Exception occurred
  //     if (e is DioException) {
  //       if (e.response!.statusCode == 400) {
  //         // Handle the 400 error explicitly
  //         print('API Response=====>>>>${e.response!.data['messages']}');
  //         Constants.showToast(msg: e.response!.data['messages'],
  //             gravity: ToastGravity.BOTTOM,
  //             color: Colors.red);
  //       } else {
  //         // Handle other errors
  //         print('Error: ${e.message}');
  //         Constants.showToast(msg:e.message!,
  //             gravity: ToastGravity.BOTTOM,
  //             color: Colors.red);
  //       }
  //     }
  //   }
  // }

  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();


  XFile? _pickedImage;

  Future<void> localImagePicker(context) async {
    final ImagePicker picker = ImagePicker();
    await Constants.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },

    );
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [

            Boyo3AppBarLogo(),
            SizedBox(width: 100,),
            isAdmin==true ? Text("Admin") : Text("User"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 30,),
            context.read<ProfileCubit>().imageCover != null
                ? Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 40.0.w,
                  backgroundImage:
                  //productImageFile != null?
                  FileImage(context.read<ProfileCubit>().imageCover!),
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
               // controller: context.read<ProfileCubit>().fullNameController,
            ),
            const SizedBox(
              height: 16.0,
            ),

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
              // controller: context.read<ProfileCubit>().usernameController,
            ),
            const SizedBox(
              height: 16.0,
            ),

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
              // controller: context.read<ProfileCubit>().phonenumberController,
            ),
            const SizedBox(
              height: 16.0,
            ),

            AppTextFormField(
              hintText:
              HomeCubit.get(context).isArabic ? "البريد الالكتروني" : 'Email',
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
            const SizedBox(
              height: 16.0,
            ),
            AppTextFormField(
              controller: context.read<ProfileCubit>().passwordController,
              hintText:
              HomeCubit.get(context).isArabic ? "كلمة المرور الجديدة" : 'New Password',
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
            const SizedBox(
              height: 30.0,
            ),
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
            ),

            ///save button
            SizedBox(
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
                  HomeCubit.get(context).isArabic?
                  "تحديث":'Update',
                  style: TextStyles.font16WhiteSemiBold,
                ),
                onPressed: () async {


                  userId == null ||userId == ""
                      ? Constants.showErrorDialog(
                      context: context,
                      msg:
                      "يجب تسجيل الدخول لتحديث البيانات ")
                      : context.read<ProfileCubit>().imageCover == null ||
                      context.read<ProfileCubit>().fullNameController.text.isEmpty||
                      context.read<ProfileCubit>().usernameController.text.isEmpty||
                      context.read<ProfileCubit>().emailController.text.isEmpty||
                      context.read<ProfileCubit>().passwordController.text.isEmpty||
                      context.read<ProfileCubit>().phonenumberController.text.isEmpty||
                      context.read<ProfileCubit>().longitude == null||
                      context.read<ProfileCubit>().latitude == null
                      ? Constants.showErrorDialog(
                      context: context,
                      msg: "من فضلك قم بادخال البيانات الصحيحة اولا ")
                      : validateThenUpdateProfile(context);



                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  void validateThenUpdateProfile(BuildContext context) {

    if (context.read<ProfileCubit>().formKey.currentState!.validate()) {
      // Ensure all controllers are not null
      if (context.read<ProfileCubit>().fullNameController.text.isNotEmpty &&
          context.read<ProfileCubit>().usernameController.text.isNotEmpty &&
          context.read<ProfileCubit>().emailController.text.isNotEmpty &&
          context.read<ProfileCubit>().phonenumberController.text.isNotEmpty &&
          context.read<ProfileCubit>().passwordController.text.isNotEmpty) {

        // final updatedProfile = Profile(
        //   id: userId,
        //   fullName: context.read<ProfileCubit>().fullNameController.text,
        //   username: context.read<ProfileCubit>().usernameController.text,
        //   email: context.read<ProfileCubit>().emailController.text,
        //   phone: context.read<ProfileCubit>().phonenumberController.text,
        //   password: context.read<ProfileCubit>().passwordController.text,
        //   imageUrl: context.read<ProfileCubit>().imageCover, // Ensure profile is not null
        // );

        context.read<ProfileCubit>().updateProfileState();
        Constants.showToast(msg: "تم التحديث بنجاح");
      } else {
        // Handle empty fields or show an error message
      }
    }

  }
  void getUserLocation() async {
    var locationData = await myLocationProvider.getLocation();
    context.read<ProfileCubit>().latitude = locationData!.latitude;
    context.read<ProfileCubit>().longitude = locationData.longitude;
    setState(() {
      latitude = context.read<ProfileCubit>().latitude;
      longitude = context.read<ProfileCubit>().longitude;
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
        context.read<ProfileCubit>().imageCover = File(coverImage!.path);
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
        context.read<ProfileCubit>().imageCover = File(coverImage!.path);
        textAlert = '';
      });
    } else {}
  }

  void removeCoverImage() {
    setState(() {
      context.read<ProfileCubit>().imageCover = null;

    });
  }

}

