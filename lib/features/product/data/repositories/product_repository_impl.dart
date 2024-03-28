import 'package:dartz/dartz.dart';
import 'package:pr8/features/product/data/datasources/local_product_datasources.dart';
import 'package:pr8/features/product/data/models/product_model.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';

import '../../../../core/error/exeption.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> addProduct(Product product) async {
    try {
      await localDataSource.addProduct(ProductModel(
          id: product.id,
          name: product.name,
          price: product.price,
          count: product.count));
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProduct() async {
    try {
      final localWeather = await localDataSource.getProduct();
      return Right(localWeather);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeProduct(Product product) async {
    try {
      await localDataSource.removeProduct(ProductModel(
          id: product.id,
          name: product.name,
          price: product.price,
          count: product.count));
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> putProduct(Product product) async {
    try {
      await localDataSource.putProduct(ProductModel(
          id: product.id,
          name: product.name,
          price: product.price,
          count: product.count));
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
