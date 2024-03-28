import 'package:dartz/dartz.dart';
import 'package:pr8/core/error/failure.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProduct();
  Future<Either<Failure, void>> addProduct(Product product);
  Future<Either<Failure, void>> putProduct(Product product);
  Future<Either<Failure, void>> removeProduct(Product product);

}
