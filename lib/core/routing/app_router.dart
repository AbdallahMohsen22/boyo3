import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/features/auth_features/login/forget_password_confirm_email_screen.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_cubit.dart';
import 'package:boyo3_v1/features/auth_features/login/forget_password_otp_screen.dart';
import 'package:boyo3_v1/features/auth_features/login/login_screen.dart';
import 'package:boyo3_v1/features/auth_features/login/reset_passwoed_screen.dart';
import 'package:boyo3_v1/features/auth_features/register/cubit/register_cubit.dart';
import 'package:boyo3_v1/features/auth_features/register/email_confirmation.dart';
import 'package:boyo3_v1/features/auth_features/register/otp_screen.dart';
import 'package:boyo3_v1/features/auth_features/register/register_screen.dart';
import 'package:boyo3_v1/features/home_features/data/models/service/service_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/shop/shop_items_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/vehicle/vehicle_model.dart';
import 'package:boyo3_v1/features/home_features/screens/auction/auction_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/generators/generators_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/camping/add_camping_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/camping/camping_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/search/search_service.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/search/search_service_result.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/service_details.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/price_filter/filter_price_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/search/search_vehicle_result.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/search/search_vehicles.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/allAdsForUserApproved/all_ads_approved_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_ads.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/category_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/ads_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_screens/package_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/add_service_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/services_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/workshops/add_workshop_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_cubit/shop_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_screens/search/search_product.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_screens/search/search_result.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_screens/shop_details.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_screens/shop_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/screens/vehicle_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/screens/vehicle_details_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/workshops/workshops.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_caravans/add_caravan_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_cars/add_cars_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_motorcycles/add_motorcycles_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_tools/add_tools_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/allAdsPending/all_ads_pending_admin.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/contact_us.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/privacy_policy.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/usage_policy.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/who_are_we.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/home/home_screen.dart';
import 'package:boyo3_v1/features/home_features/screens/home/news/cubit/news_cubit.dart';
import 'package:boyo3_v1/features/profile/profile_cuibt.dart';
import 'package:boyo3_v1/features/splash/splash_screen.dart';
import 'package:boyo3_v1/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home_features/screens/drawer/allAdsForUserApproved/all_services_approved_screen.dart';
import '../../features/home_features/screens/drawer/allAdsForUserPending/all_ads_pending_screen.dart';
import '../../features/home_features/screens/drawer/drawer_screens/allServicePending/allServicePendingAdmin.dart';
import '../../features/profile/profile_screen.dart';

class VehicleArgumet {
  VehicleModel vehicleModel;
  VehicleArgumet(this.vehicleModel);
}

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be bassed in any screen like this >> (arguments as ClassName)
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<NewsCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<VehicleCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ShopCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ServiceCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.drawerScreen:
        return MaterialPageRoute(
          builder: (_) => DrawerScreen(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AdsPackagesCubit>(),
            child: CategoriesScreen(),
          ),
        );
      case Routes.contactUsScreen:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );
      case Routes.serviceScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ServiceCubit>(),
            child: ServiceScreen(),
          ),
        );

      case Routes.workshop:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ServiceCubit>(),
            child: WorkShopScreen(),
          ),
        );
      case Routes.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicy(),
        );
      case Routes.usagePolicyScreen:
        return MaterialPageRoute(
          builder: (_) => const UsagePolicy(),
        );
      case Routes.whoAreWeScreen:
        return MaterialPageRoute(
          builder: (_) => WhoAreWeScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

        case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ResetPasswordScreen(),
          ),
        );

       case Routes.forgetPasswordConfirmEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: ForgetPasswordConfirmEmailScreen(),
          ),
        );
        case Routes.forgetPasswordConfirmOtp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: ForgetPasswordOtpScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ProfileScreen(userId: '',),
          ),
        );
      case Routes.confirmEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: ConfirmEmailScreen(),
          ),
        );

      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: OtpScreen(),
          ),
        );

      case Routes.vehicleScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VehicleCubit>(),
            child: VehicleScreen(
              type1: args as String,
            ),
          ),
        );

        case Routes.filterPriceVehiclesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VehicleCubit>(),
            child: const FilterPriceVehiclesScreen(
            ),
          ),
        );

      case Routes.addCaravanScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VehicleCubit>(),
            child: AddCaravanScreen(),
          ),
        );

      case Routes.addCarsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VehicleCubit>(),
            child: AddCarsScreen(),
          ),
        );

      case Routes.addMotorcycles:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VehicleCubit>(),
            child: AddMotorcyclesScreen(),
          ),
        );

      case Routes.addTools:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VehicleCubit>(),
            child: AddToolsScreen(),
          ),
        );

      case Routes.vehicleDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VehicleCubit>(),
            child: VehicleDetails(
              vehicleModel: args as VehicleModel,
            ),
          ),
        );
      case Routes.shopDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ShopCubit>(),
            child: ShopDetails(
              shopItemModel: args as ShopItemModel,
            ),
          ),
        );
      case Routes.adsPackagesScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AdsPackagesCubit>(),
              ),
              //UserAddPackageCubit
              BlocProvider(
                create: (context) => getIt<UserAddPackageCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ServicesPackagesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<UserAddServicesPackagesCubit>(),
              ),
            ],
            child: AdsPackagesScreen(),
          ),
        );
      case Routes.shopScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ShopCubit>(),
            child: ShopScreen(),
          ),
        );

      case Routes.searchProductScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ShopCubit>(),
            child: SearchProductScreen(),
          ),
        );

      case Routes.searchProductResultScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ShopCubit>(),
            child: SearchProductResult(
              searchKey: args as String,
            ),
          ),
        );

        

        case Routes.searachVehicle:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<VehicleCubit>(),
              child: SearchVehiclesScreen(),
            ),
        );
        case Routes.searachVehicleResult:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<VehicleCubit>(),
              child: SearchVehiclesResult(
                searchKey: args as String,
              ),
            ),
          );

          case Routes.searachServices:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<ServiceCubit>(),
              child: SearchServiceScreen(),
            ),
        );
        case Routes.searachServicesResult:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<ServiceCubit>(),
              child: SearchServiceResult(
                searchKey: args as String,
              ),
            ),
          );
      

      case Routes.addService:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ServiceCubit>(),
            child: AddServiceScreen(),
          ),
        );

        case Routes.addcamping:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ServiceCubit>(),
            child: AddCampingScreen(),
          ),
        );
      case Routes.addWorkshop:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ServiceCubit>(),
            child: AddWorkshopScreen(),
          ),
        );
        case Routes.campingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ServiceCubit>(),
            child: CampingScreen(),
          ),
        );
      case Routes.serviceDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ServiceCubit>(),
            child: ServiceDetails(
              serviceModel: args as ServiceModel,
            ),
          ),
        );

    //GetAllService/Pending
      case Routes.allServicesPendingScreen:
        return MaterialPageRoute(builder: (_) => AllServicesPendingScreen());

    //GetAllSAds/Pending
      case Routes.allAdsPendingScreen:
        return MaterialPageRoute(builder: (_) => AllAdsPendingScreen());

    //Get All Ads Approved for users
      case Routes.allAdsApprovedScreenForUsers:
        return MaterialPageRoute(builder: (_) => AllAdsApprovedScreen());
    //Get All Services Approved for users
      case Routes.allServicesApprovedScreenForUsers:
        return MaterialPageRoute(builder: (_) => AllServicesApprovedScreen());

    //Get All Ads Pending for users
      case Routes.allAdsPendingScreenForUsers:
        return MaterialPageRoute(builder: (_) => AllAdsPendingScreenForUser());

      //AddAdsScreen
      case Routes.addAdsScreen:
        return MaterialPageRoute(builder: (_) => AddAdsScreen());
       case Routes.auctionScreen:
        return MaterialPageRoute(
          builder: (_) => AuctionScreen(),
        );


      case Routes.generatorScreen:
        return MaterialPageRoute(builder: (_) => GeneratorScreen());
       
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: Text('No route define for ${settings.name}'),
                  ),
                ));
    }
  }
}
