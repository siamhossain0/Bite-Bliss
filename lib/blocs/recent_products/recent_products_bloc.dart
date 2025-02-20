import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product.dart';

// Events
abstract class RecentProductsEvent {}

class AddRecentProduct extends RecentProductsEvent {
  final Product product;
  AddRecentProduct(this.product);
}

// States
abstract class RecentProductsState {}

class RecentProductsInitial extends RecentProductsState {}

class RecentProductsLoaded extends RecentProductsState {
  final List<Product> products;
  RecentProductsLoaded(this.products);
}

// BLoC
class RecentProductsBloc extends Bloc<RecentProductsEvent, RecentProductsState> {
  final List<Product> _recentProducts = [];

  RecentProductsBloc() : super(RecentProductsInitial()) {
    on<AddRecentProduct>((event, emit) {
      if (!_recentProducts.contains(event.product)) {
        if (_recentProducts.length >= 10) {
          _recentProducts.removeLast();
        }
        _recentProducts.insert(0, event.product);
        emit(RecentProductsLoaded(List.from(_recentProducts)));
      }
    });
  }
} 