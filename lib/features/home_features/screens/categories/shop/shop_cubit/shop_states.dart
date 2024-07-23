import 'package:freezed_annotation/freezed_annotation.dart';
part 'shop_states.freezed.dart';

@freezed
class ShopState<T> with _$ShopState<T> {
  const factory ShopState.initial() = _Initial;

  const factory ShopState.loading() = Loading;
  const factory ShopState.success(T data) = Success<T>;
  const factory ShopState.error({required String error}) = Error;
}
