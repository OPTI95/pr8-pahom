import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pr8/core/error/failure.dart';
import 'package:pr8/features/admin/domain/usecases/add_product.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';
import 'package:pr8/features/product/domain/repositories/product_repository.dart';

import '../../../../core/usecase/usecase.dart';

class RemoveProduct extends UseCase<void, ProductParams> {
  final ProductRepository repository;
  RemoveProduct(this.repository);
  @override
  Future<Either<Failure, void>> call(ProductParams params) async {
    return await repository.removeProduct(params.product);
  }
}


