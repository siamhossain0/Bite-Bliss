import 'package:equatable/equatable.dart';
import '../../core/enums/location_status.dart';

class LocationState extends Equatable {
  final LocationStatus status;
  final String? error;

  const LocationState({
    this.status = LocationStatus.initial,
    this.error,
  });

  LocationState copyWith({
    LocationStatus? status,
    String? error,
  }) {
    return LocationState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, error];
} 