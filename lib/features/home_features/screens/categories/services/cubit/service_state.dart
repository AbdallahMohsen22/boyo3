import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_state.freezed.dart';

@freezed
class ServiceState<T> with _$ServiceState<T> {
  const factory ServiceState.initial() = _Initial;

  const factory ServiceState.loading() = Loading;
  const factory ServiceState.success(T data) = Success<T>;
  const factory ServiceState.error({required String error}) = Error;
}
