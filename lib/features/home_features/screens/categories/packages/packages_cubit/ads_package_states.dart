import 'package:freezed_annotation/freezed_annotation.dart';
part 'ads_package_states.freezed.dart';

@freezed
class AdsPackagesState<T> with _$AdsPackagesState<T> {
  const factory AdsPackagesState.initial() = _Initial;

  const factory AdsPackagesState.loading() = Loading;
  const factory AdsPackagesState.success(T data) = Success<T>;
  const factory AdsPackagesState.error({required String error}) = Error;
}
