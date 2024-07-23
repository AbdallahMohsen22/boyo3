import 'dart:io';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/widgets/pick_image_item.dart';

class AddVehiclesBasicImages extends StatefulWidget {
  const AddVehiclesBasicImages({super.key});

  @override
  State<AddVehiclesBasicImages> createState() => _AddVehiclesBasicImagesState();
}

class _AddVehiclesBasicImagesState extends State<AddVehiclesBasicImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            PickImage(
              title: 'صوره1',
              imageFile: context.read<VehicleCubit>().image1,
              getGalleryImage: getGalleryProfileImage,
              removeImage: removeProfileImage,
            ),
            const Spacer(),
            PickImage(
              title: 'صوره2',
              imageFile: context.read<VehicleCubit>().image2,
              getGalleryImage: getGalleryCoverImage,
              removeImage: removeCoverImage,
            ),
            const Spacer(),
            PickImage(
              title: 'صوره3',
              imageFile: context.read<VehicleCubit>().image3,
              getGalleryImage: getGalleryIdImage,
              removeImage: removeIdImage,
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  final ImagePicker picker = ImagePicker();
  String profileImageUrl = '';
  XFile? profileImage;
  File? profileImageFile;
  Future<void> getGalleryProfileImage() async {
    profileImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (profileImage != null) {
      setState(() {
        profileImageFile = File(profileImage!.path);
        context.read<VehicleCubit>().image1 = File(profileImage!.path);
      });
    } else {}
  }

  Future<void> getCameraProfileImage() async {
    profileImage = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (profileImage != null) {
      setState(() {
        profileImageFile = File(profileImage!.path);
      });
    } else {}
  }

  void removeProfileImage() {
    setState(() {
      profileImageFile = null;
      context.read<VehicleCubit>().image1 = null;
    });
  }

  ///cover
  String coverImageUrl = '';
  XFile? coverImage;
  File? coverImageFile;
  Future<void> getGalleryCoverImage() async {
    coverImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (coverImage != null) {
      setState(() {
        coverImageFile = File(coverImage!.path);
        context.read<VehicleCubit>().image2 = File(coverImage!.path);
      });
    } else {}
  }

  void removeCoverImage() {
    setState(() {
      coverImageFile = null;
      context.read<VehicleCubit>().image2 = null;
    });
  }

  ///id
  String idImageUrl = '';
  XFile? idImage;
  File? idImageFile;
  Future<void> getGalleryIdImage() async {
    idImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (idImage != null) {
      setState(() {
        context.read<VehicleCubit>().image3 = File(idImage!.path);
        idImageFile = File(idImage!.path);
      });
    } else {}
  }

  void removeIdImage() {
    setState(() {
      context.read<VehicleCubit>().image3 = null;
      idImageFile = null;
    });
  }
}
