part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> list;

  ProductLoaded({required this.list});
}

class ProductError extends ProductState{
  final String error;

  ProductError({required this.error});
}