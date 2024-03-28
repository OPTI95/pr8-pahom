import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:pr8/features/admin/domain/usecases/add_product.dart';
import 'package:pr8/features/admin/domain/usecases/put_product.dart';
import 'package:pr8/features/admin/domain/usecases/remove_product.dart';
import 'package:pr8/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:pr8/features/product/data/datasources/local_product_datasources.dart';
import 'package:pr8/features/product/domain/usecases/get_product.dart';
import 'package:pr8/features/product/presentation/cubit/product_cubit.dart';

import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => AdminCubit(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerFactory(
    () => ProductCubit(
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => AddProduct(sl()));
  sl.registerLazySingleton(() => PutProduct(sl()));
  sl.registerLazySingleton(() => RemoveProduct(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(),
  );
}

void initFeatures() {}
