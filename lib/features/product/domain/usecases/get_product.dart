import 'package:dartz/dartz.dart';
import 'package:pr8/core/error/failure.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';
import 'package:pr8/features/product/domain/repositories/product_repository.dart';

import '../../../../core/usecase/usecase.dart';

class GetProduct extends UseCase<List<Product>, NoParams> {
  final ProductRepository repository;
  GetProduct(this.repository);
  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getProduct();
  }
}
