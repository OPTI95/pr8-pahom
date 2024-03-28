import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pr8/core/error/failure.dart';
import 'package:pr8/features/product/domain/usecases/get_product.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/product_entity.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProduct getProduct;
  ProductCubit(this.getProduct) : super(ProductInitial());

  Future<void> fetchProductList() async {
    try {
      emit(ProductLoading());
      final loadedHardwareOrFailure = await getProduct(NoParams());
      loadedHardwareOrFailure.fold(
          (error) => emit(ProductError(
              error: error is ServerFailure
                  ? "SERVER_FAILURE_MESSAGE"
                  : "CACHE_FAILURE_MESSAGE")), (readingEntitiy) async {
        emit(ProductLoaded(list: readingEntitiy));
      });
    } catch (_) {}
  }
}
