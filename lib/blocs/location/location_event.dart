import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class RequestLocation extends LocationEvent {}

class SkipLocation extends LocationEvent {} 