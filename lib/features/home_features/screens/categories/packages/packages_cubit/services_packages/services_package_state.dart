
import 'package:freezed_annotation/freezed_annotation.dart';
 part 'services_package_state.freezed.dart';
@freezed
class ServicePackagesState<T> with _$ServicePackagesState<T> {
  const factory ServicePackagesState.initial() = _Initial;

  const factory ServicePackagesState.loading() = Loading;
  const factory ServicePackagesState.success(T data) = Success<T>;
  const factory ServicePackagesState.error({required String error}) = Error;
}
