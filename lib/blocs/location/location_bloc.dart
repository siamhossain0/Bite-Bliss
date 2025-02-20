import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/enums/location_status.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<RequestLocation>(_onRequestLocation);
    on<SkipLocation>(_onSkipLocation);
  }

  Future<void> _onRequestLocation(
    RequestLocation event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(status: LocationStatus.loading));
    
    try {
      // Simulate location request
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: LocationStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: LocationStatus.failure,
        error: e.toString(),
      ));
    }
  }

  void _onSkipLocation(
    SkipLocation event,
    Emitter<LocationState> emit,
  ) {
    emit(state.copyWith(status: LocationStatus.skipped));
  }
} 