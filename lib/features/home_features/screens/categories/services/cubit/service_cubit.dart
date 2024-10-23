import 'dart:io';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/service_repo.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final ServiceRepo _serviceRepo;
  ServiceCubit(this._serviceRepo) : super(const ServiceState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController searchNameController = TextEditingController();

  void emitGetAllService({
    required String service,
  }) async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.getServiceByFilter(
      service: service,
    );
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

    void emitGetServiceByCountry({
    required String servName, required String country
  }) async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.getServiceByCountry(
      servName: servName,country:country,
    );
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitGetAllGoldService() async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.getAllGoldService();
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitGetWorkShopAndExhibition({
    required String type,
  }) async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.getWorkShopAndExhibition(
      service: ApiConstants.workShop,
      type: type,
    );
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitSearchService({
    required String serviceName,
  }) async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.searchService(ServiceName: serviceName);
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController type2Controller = TextEditingController();
  TextEditingController type3Controller = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController warrantyController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController countPersonController = TextEditingController();
  TextEditingController countDayController = TextEditingController();
  TextEditingController fromCountryController = TextEditingController();
  TextEditingController toCountryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  File? image1;
  File? image2;
  File? image3;

  double? longitude;
  double? latitude;

  void emitGetAddService({
    required String userId,
    required BuildContext context,
  }) async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.addService(
        userId: userId,
        title: titleController.text,
        type: typeController.text,
        type2: typeController.text,
        type3: type3Controller.text,
        price: int.parse(priceController.text),
        image1: image1!,
        image2: image2!,
        image3: image3!,
        phoneNumber: phoneNumberController.text,
        whatsAppNumber: whatsAppNumberController.text,
        description: descriptionController.text,
        warranty: warrantyController.text,
        country: countryController.text,
        city: cityController.text,
        longitude: longitude!.toString(),
        latitude: latitude!.toString(),
        countDay: int.parse(countDayController.text),
        countPerson: int.parse(countPersonController.text),
        fromCountry: "no data",//fromCountryController.text,
        toCountry: "no data",//toCountryController.text,
        createdDate: "2-2-2025");
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
      Navigator.pop(context);
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitGetAddWorkshops({
    required String userId,
    required BuildContext context,
  }) async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.addService(
        userId: userId,
        title: titleController.text,
        type: ApiConstants.workShop,
        type2: ApiConstants.workShop,
        type3: ApiConstants.out,
        price: 0,
        image1: image1!,
        image2: image2!,
        image3: image3!,
        phoneNumber: phoneNumberController.text,
        whatsAppNumber: whatsAppNumberController.text,
        description: descriptionController.text,
        warranty: ApiConstants.noData,
        country: countryController.text,
        city: cityController.text,
        longitude: longitude!.toString(),
        latitude: latitude!.toString(),
        countDay: 0,//int.parse(countDayController.text),
        countPerson:0, //int.parse(countPersonController.text),
        fromCountry: fromCountryController.text,
        toCountry: toCountryController.text,
        createdDate: "2-2-2025");
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
      Navigator.pop(context);
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));

    });
  }

  void emitGetAddCamping({
    required String userId,
    required BuildContext context,
  }) async {
    emit(const ServiceState.loading());
    final response = await _serviceRepo.addService(
      userId: userId,
      title: titleController.text,
      type: ApiConstants.camping,
      type2: ApiConstants.camping,
      type3: ApiConstants.out,
      price: int.parse(priceController.text),
      image1: image1!,
      image2: image2!,
      image3: image3!,
      phoneNumber: phoneNumberController.text,
      whatsAppNumber: whatsAppNumberController.text,
      description: descriptionController.text,
      warranty: ApiConstants.noData,
      country: countryController.text,
      longitude: longitude!.toString(),
      latitude: latitude!.toString(),
      countDay: int.parse(countDayController.text),
      countPerson: int.parse(countPersonController.text),
      fromCountry: fromCountryController.text,
      toCountry: toCountryController.text,
      createdDate: "2-2-2025",
      city: cityController.text,
    );
    response.when(success: (getAllServiceResponse) {
      emit(ServiceState.success(getAllServiceResponse));
      Navigator.pop(context);
    }, failure: (error) {
      emit(ServiceState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }


}
