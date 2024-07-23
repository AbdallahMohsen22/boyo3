import 'package:freezed_annotation/freezed_annotation.dart';
part 'vehicle_states.freezed.dart';

@freezed
class VehicleState<T> with _$VehicleState<T> {
  const factory VehicleState.initial() = _Initial;

  const factory VehicleState.loading() = Loading;
  const factory VehicleState.success(T data) = Success<T>;
  const factory VehicleState.error({required String error}) = Error;
}
