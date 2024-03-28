import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pr8/core/error/failure.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';
import 'package:pr8/features/product/domain/repositories/product_repository.dart';

import '../../../../core/usecase/usecase.dart';

class AddProduct extends UseCase<void, ProductParams> {
  final ProductRepository repository;
  AddProduct(this.repository);
  @override
  Future<Either<Failure, void>> call(ProductParams params) async {
    return await repository.addProduct(params.product);
  }
}

class ProductParams extends Equatable {
  final Product product;

  const ProductParams({required this.product});

  @override
  List<Object?> get props => [product];
}
