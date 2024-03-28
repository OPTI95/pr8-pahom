part of 'admin_cubit.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminProductAdd extends AdminState {}

class AdminProductPut extends AdminState {}

class AdminProductLoaded extends AdminState {
  final List<Product> list;

  AdminProductLoaded({required this.list});
}

class AdminProductLoading extends AdminState {}

class AdminProductError extends AdminState{
  final String error;

  AdminProductError({required this.error});
}
