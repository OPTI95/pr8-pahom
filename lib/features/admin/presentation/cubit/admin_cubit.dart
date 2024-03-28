import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pr8/core/error/failure.dart';
import 'package:pr8/features/admin/domain/usecases/add_product.dart';
import 'package:pr8/features/admin/domain/usecases/remove_product.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';
import 'package:pr8/features/product/domain/usecases/get_product.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/put_product.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final GetProduct getProduct;
  final AddProduct addProduct;
  final RemoveProduct removeProduct;
  final PutProduct putProduct;

  AdminCubit(
      this.addProduct, this.putProduct, this.getProduct, this.removeProduct)
      : super(AdminInitial());
  Future<void> fetchProductList() async {
    try {
      emit(AdminProductLoading());
      final loadedHardwareOrFailure = await getProduct(NoParams());
      loadedHardwareOrFailure.fold(
          (error) => emit(AdminProductError(
              error: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (readingEntitiy) async {
        emit(AdminProductLoaded(list: readingEntitiy));
      });
    } catch (_) {}
  }

  Future<void> addNewProduct(Product newProduct) async {
    try {
      final loadedHardwareOrFailure =
          await addProduct(ProductParams(product: newProduct));
      loadedHardwareOrFailure.fold(
          (error) => emit(AdminProductError(
              error: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (readingEntitiy) async {
        emit(AdminInitial());
      });
    } catch (_) {}
  }

  Future<void> deleteProduct(Product exProduct) async {
    try {
      final loadedHardwareOrFailure =
          await removeProduct(ProductParams(product: exProduct));
      loadedHardwareOrFailure.fold(
          (error) => emit(AdminProductError(
              error: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (readingEntitiy) async {
        emit(AdminInitial());
      });
    } catch (_) {}
  }

  Future<void> putExProduct(Product exProduct) async {
    try {
      final loadedHardwareOrFailure =
          await putProduct(ProductParams(product: exProduct));
      loadedHardwareOrFailure.fold(
          (error) => emit(AdminProductError(
              error: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (readingEntitiy) async {
        emit(AdminInitial());
      });
    } catch (_) {}
  }
}
