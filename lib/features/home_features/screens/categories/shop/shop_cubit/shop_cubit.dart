import 'package:boyo3_v1/features/home_features/domain/shop_repo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_cubit/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopState> {
  final ShopRepo _shopRepo;
  ShopCubit(this._shopRepo) : super(const ShopState.initial());

  void emitGetAllAdsProductsStates() async {
    emit(const ShopState.loading());
    final response = await _shopRepo.getAllAdsProducts();
    response.when(success: (getAllAdsProductsResponse) {
      emit(ShopState.success(getAllAdsProductsResponse));
    }, failure: (error) {
      emit(ShopState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  TextEditingController searchNameController = TextEditingController();
  void emitSearchShopStates({
    required String searchName,

  }) async {
    emit(const ShopState.loading());
    final response = await _shopRepo.searchProduct(
      productName: searchName,
    );
    response.when(success: (getAllAdsProductsResponse) {
      emit(ShopState.success(getAllAdsProductsResponse));
    }, failure: (error) {
      emit(ShopState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
}
