import 'dart:convert';
import 'dart:io';
import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/home_features/domain/vehicle_repo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;

import '../../../../../../core/routing/routes.dart';
import '../../../../cubit/home_cubit/home_cubit.dart';

class VehicleCubit extends Cubit<VehicleState> {
  final VehicleRepo _vehicleRepo;
  VehicleCubit(this._vehicleRepo) : super(const VehicleState.initial());

  // void filterCity({
  //   required String city,
  // })async{
  //
  //   Response response = await http.get(
  //     Uri.parse("http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsCity"),
  //     headers: {
  //       "cache-control": "no-cache",
  //       "content-type": "application/json",
  //       // "charset=utf-8 date": Sat,11 May 2024 07:13:10 GMT
  //       "server": "Microsoft-IIS/10.0",
  //       "transfer-encoding": "chunked",
  //       "x-powered-by": "ASP.NET",
  //       "city": city.toString()
  //     },
  //     // body: {
  //     //   "name":name,
  //     //   "email":email,
  //     //   "phone":phone,
  //     //   "password":password
  //     // }
  //   );
  //   print("begain 1");
  //   var responseBody = jsonDecode(response.body);
  //   if (response.statusCode==200) {
  //     if (responseBody["status"] == true) {
  //       print("success xxxxxxx");
  //       print(responseBody);
  //       emit(FilterCitySuccessState());
  //     } else {
  //       print(responseBody);
  //       emit(FilterCityFailedState(errorMessage: responseBody['message']));
  //     }
  //   }
  //   // print("begain");
  //   //  emit(FilterCityLoadingState());
  //   // try {
  //   //
  //   // } catch (e) {
  //   //   emit(FilterCityFailedState(errorMessage: e.toString()));
  //   // }
  //
  // }


    final formKey = GlobalKey<FormState>();
  String countryValue = CountryNames.emarates;
  List<String> countryList = [
    CountryNames.emarates,
    CountryNames.elSaudia,
    CountryNames.qatar,
    CountryNames.elBahrin,
    CountryNames.iraq,
    CountryNames.kewait,
    CountryNames.oman,
  ];


  String emaratesCitiesValue = CountryNames.emarates;
  List<String> emaratesCitiesList = [
    CountryNames.emarates,

  ];

  String elSaudiaCitiesValue = CountryNames.elSaudia;
  List<String> elSaudiaCitiesList = [

    CountryNames.elSaudia,
  ];

  String qatarCitiesValue = CountryNames.qatar;
  List<String> qatarCitiesList = [
    CountryNames.qatar,

  ];

  String elBahrinCitiesValue = CountryNames.elBahrin;
  List<String> elBahrinCitiesList = [
    CountryNames.elBahrin,
  ];

  String iraqCitiesValue = CountryNames.iraq;
  List<String> iraqCitiesList = [
    CountryNames.iraq,

  ];

  String kewaitCitiesValue = CountryNames.kewait;
  List<String> kewaitCitiesList = [

    CountryNames.kewait,
  ];

  String omanCitiesValue = CountryNames.oman;
  List<String> omanCitiesList = [
    CountryNames.oman,
  ];

  String citiesValue="";
  List<String> citiesList = [];

  void emitChangeCity()  {
    emit(const VehicleState.loading());
  if(countryValue==CountryNames.emarates){
    citiesValue=emaratesCitiesValue;
    citiesList=emaratesCitiesList;

  }else if(countryValue==CountryNames.elSaudia){
    citiesValue=elSaudiaCitiesValue;
    citiesList=elSaudiaCitiesList;
  }
    // emit(VehicleState.success());

    // response.when(success: (getAllVehiclesResponse) {
    // }, failure: (error) {
    //   emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    // });
  }


    TextEditingController searchNameController=TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController typeController = TextEditingController();
    TextEditingController type2Controller = TextEditingController();
    TextEditingController type3Controller = TextEditingController();
    TextEditingController type4Controller = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController whatsAppNumberController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController warrantyController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController longitudeController = TextEditingController();
    TextEditingController latitudeController = TextEditingController();
    TextEditingController colorInController = TextEditingController();
    TextEditingController colorOutController = TextEditingController();
    TextEditingController yearMakeController = TextEditingController();
    TextEditingController addOnsController = TextEditingController();
    TextEditingController publicStatusController = TextEditingController();
    TextEditingController faultsController = TextEditingController();
    TextEditingController securityController = TextEditingController();
    TextEditingController specificationsController = TextEditingController();
    TextEditingController sizeController = TextEditingController();
    TextEditingController generatorTypeController = TextEditingController();
    TextEditingController airConditionTypeController = TextEditingController();
    TextEditingController airConditionSizeController = TextEditingController();
    TextEditingController airConditionCountController = TextEditingController();
    TextEditingController normalOrSaylantController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController cylindersController = TextEditingController();
    TextEditingController kilometerController = TextEditingController();
    TextEditingController numberOfParsonController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    File? image1;
    File?  image2;
    File?  image3;

    
  double? longitude;
  double? latitude;


  void emitGetAllVehicles({
    required String type1,
    required String type2,
  }) async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getVehicleByFilter(
      type1: type1,
      type2: type2,
    );

    response.when(success: (getAllVehiclesResponse) {
      emit(VehicleState.success(getAllVehiclesResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitGetGoldCaravan() async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getGoldCaravan();

    response.when(success: (getGoldCaravanResponse) {
      emit(VehicleState.success(getGoldCaravanResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitGetGoldCars() async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getGoldCars();

    response.when(success: (getGoldCarsResponse) {
      emit(VehicleState.success(getGoldCarsResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void getGoldMotorcycles() async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getGoldMotorcycles();

    response.when(success: (getGoldMotorcyclesResponse) {
      emit(VehicleState.success(getGoldMotorcyclesResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages?? ''));
    });
  }

  void emitGetAllGoldAds() async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getAllGoldAds();

    response.when(success: (getGoldMotorcyclesResponse) {
      emit(VehicleState.success(getGoldMotorcyclesResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages?? ''));
    });
  }

  void getGoldTools() async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getGoldTools();
    response.when(success: (getGoldToolsResponse) {
      emit(VehicleState.success(getGoldToolsResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  
  void searchForVehiclesOrTools({
    required String vehicleOrToolName,
  }) async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.searchForVehicleOrTool(
      vehicleOrToolName: vehicleOrToolName
    );
    response.when(success: (getGoldToolsResponse) {
      emit(VehicleState.success(getGoldToolsResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void filterAdsByVehicleType1AndType2AndCountry({
    required String country,
    required String type2,
    required String vehicleType,
  }) async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.filterAdsByVehicleType1AndType2AndCountry(
      country: country,
      type2: type2,
      vehicleType: vehicleType,
    );
    response.when(success: (getGoldToolsResponse) {
      emit(VehicleState.success(getGoldToolsResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  // void filterAdsByVehicleType1AndType2AndCity({
  //   required String city,
  //   required String type2,
  //   required String vehicleType,
  // }) async {
  //   emit(const VehicleState.loading());
  //   final response = await _vehicleRepo.filterAdsByVehicleType1AndType2AndCity(
  //     city: city,
  //     type2: type2,
  //     vehicleType: vehicleType,
  //   );
  //   response.when(success: (getGoldToolsResponse) {
  //     emit(VehicleState.success(getGoldToolsResponse));
  //   }, failure: (error) {
  //     emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
  //   });
  // }
    
   void filterAdsByVehicleType1AndType2AndType3({
    required String vehicleCondition,
    required String type2,
    required String vehicleType,
  }) async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getAdsByVehicleType1And2And3(
      vehicleCondition: vehicleCondition,
      type2: type2,
      vehicleType: vehicleType,
    );
    response.when(success: (getGoldToolsResponse) {
      emit(VehicleState.success(getGoldToolsResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
    TextEditingController minPriceController = TextEditingController();
    TextEditingController maxPriceController = TextEditingController();

    void getVehiclesByPrice() async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.getVehiclesByPrice(
      minPrice:double.parse(minPriceController.text),
      maxPrice:double.parse(maxPriceController.text),
    );
    response.when(success: (getVehiclesResponse) {
      emit(VehicleState.success(getVehiclesResponse));
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
    


  void emitAddCaravan({
    required String id,
    required BuildContext  context,
  }) async {

    emit(const VehicleState.loading());
    final response = await _vehicleRepo.addCarvan(
        id: id,
        title: titleController.text,
        type:   ApiConstants.caravan,
        type2: type2Controller.text,
        type3: type3Controller.text,
        type4:type4Controller.text,
        image1: image1!,
        image2: image2!,
        image3: image3!,
        price: int.parse(priceController.text),
        phoneNumber: phoneNumberController.text,
        whatsAppNumber: whatsAppNumberController.text,
        description: descriptionController.text,
        warranty: warrantyController.text,
        country: countryController.text,
        city: cityController.text,
        longitude: longitude.toString(),
        latitude: latitude.toString(),
        adsType: adsPackageId ==1 ? "Gold" : adsPackageId ==2?"Silver":adsPackageId ==3?"Bronze":adsPackageId ==4?"Free":"Nopackage",
        colorIn: colorInController.text,
        colorOut: colorOutController.text,
        yearMake: yearMakeController.text,
        cylinders: int.parse(cylindersController.text),
        kilometer: int.parse(kilometerController.text) ,
        addOns: addOnsController.text,
        publicStatus: publicStatusController.text,
        faults: faultsController.text,
        security: securityController.text,
        specifications: specificationsController.text,
        size: sizeController.text,
        generatorType: generatorTypeController.text,
        airConditionType: airConditionTypeController.text,
        airConditionSize: airConditionSizeController.text,
        airConditionCount: airConditionCountController.text,
        normalOrSaylant: normalOrSaylantController.text,
        numberOfParson: int.parse(numberOfParsonController.text),
        height: int.parse(heightController.text),
        createdDate: '2-2-2022');

    response.when(success: (addCaravanResponse) {
      emit(VehicleState.success(addCaravanResponse));
      Navigator.pop(context);
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitAddCar({
    required String id,
    required BuildContext context,
  }) async {

    emit(const VehicleState.loading());
    final response = await _vehicleRepo.addCar(
        id: id,
        title: titleController.text,
        type: ApiConstants.cars,
        type2: type2Controller.text,
        type3: type3Controller.text,
        type4:type4Controller.text,
        image1: image1!,
        image2: image2!,
        image3: image3!,
        price: int.parse(priceController.text),
        phoneNumber: phoneNumberController.text,
        whatsAppNumber: whatsAppNumberController.text,
        description: descriptionController.text,
        warranty: warrantyController.text,
        country: countryController.text,
         city: cityController.text,
        longitude: longitude.toString(),
        latitude: latitude.toString(),
        adsType:adsPackageId ==1 ? "Gold" : adsPackageId ==2?"Silver":adsPackageId ==3?"Bronze":adsPackageId ==4?"Free":"Nopackage",  
        colorIn: colorInController.text,
        colorOut: colorOutController.text,
        yearMake: yearMakeController.text,
        cylinders: int.parse(cylindersController.text),
        kilometer: int.parse(kilometerController.text) ,
        addOns: addOnsController.text,
        publicStatus: publicStatusController.text,
        security: securityController.text,
        specifications: specificationsController.text,
        createdDate:  '2-2-2022');

    response.when(success: (addCarResponse) {
      emit(VehicleState.success(addCarResponse));
      Navigator.pop(context);
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitAddMotorCycle({
    required String id,
    required BuildContext context,
  }) async {
    emit(const VehicleState.loading());
    final response = await _vehicleRepo.addMotorCycle(
        id: id,
        title: titleController.text,
        type: ApiConstants.motorcycles,
        type2: type2Controller.text,
        type3: type3Controller.text,
        type4:type4Controller.text,
        image1: image1!,
        image2: image2!,
        image3: image3!,
        price: int.parse(priceController.text),
        phoneNumber: phoneNumberController.text,
        whatsAppNumber: whatsAppNumberController.text,
        description: descriptionController.text,
        warranty: warrantyController.text,
        country: countryController.text,
         city: cityController.text,
        longitude: longitude.toString(),
        latitude: latitude.toString(),
        adsType:adsPackageId ==1 ? "Gold" : adsPackageId ==2?"Silver":adsPackageId ==3?"Bronze":adsPackageId ==4?"Free":"Nopackage",  
        colorOut: colorOutController.text,
        yearMake: yearMakeController.text,
        cylinders: int.parse(cylindersController.text),
        kilometer: int.parse(kilometerController.text) ,
        addOns: addOnsController.text,
        publicStatus: publicStatusController.text,
        security: securityController.text,
        specifications: specificationsController.text,
        createdDate: '2-2-2022');
    response.when(success: (addMotorCycleResponse) {
      emit(VehicleState.success(addMotorCycleResponse));
       Navigator.pop(context);

    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
  
  void emitAddTools({
    required String id,
    required BuildContext context,
  }) async {

    emit(const VehicleState.loading());
    final response = await _vehicleRepo.addTools(
        id: id,
        title: titleController.text,
        type: ApiConstants.tools,
        type2: type2Controller.text,
        type3: type3Controller.text,
        type4:type4Controller.text,
        image1: image1!,
        image2: image2!,
        image3: image3!,
        price: int.parse(priceController.text),
        phoneNumber: phoneNumberController.text,
        whatsAppNumber: whatsAppNumberController.text,
        description: descriptionController.text,
        warranty: warrantyController.text,
        country: countryController.text,
        city: cityController.text,
        longitude: longitude.toString(),
        latitude: latitude.toString(),
        adsType:adsPackageId ==1 ? "Gold" : adsPackageId ==2?"Silver":adsPackageId ==3?"Bronze":adsPackageId ==4?"Free":"Nopackage",  
        yearMake: yearMakeController.text,
        addOns: addOnsController.text,
        publicStatus: publicStatusController.text,
        security: securityController.text,
        specifications: specificationsController.text,
        createdDate: '2-2-2022');

    response.when(success: (addToolsResponse) {
      emit(VehicleState.success(addToolsResponse));
      Navigator.pop(context);
    }, failure: (error) {
      emit(VehicleState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

}
