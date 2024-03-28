import 'package:hive/hive.dart';
import 'package:pr8/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getProduct();
  Future<void> addProduct(ProductModel productModel);
  Future<void> removeProduct(ProductModel model);
  Future<void> putProduct(ProductModel productModel);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final _boxName = 'productBox';

  ProductLocalDataSourceImpl();

  @override
  Future<void> addProduct(ProductModel model) async {
    final box = await Hive.openBox<ProductModel>(_boxName);
    await box.add(model);
  }

  @override
  Future<void> removeProduct(ProductModel model) async {
    final box = await Hive.openBox<ProductModel>(_boxName);
    await box.delete(model.id); 
  }

  @override
  Future<void> putProduct(ProductModel model) async {
    final box = await Hive.openBox<ProductModel>(_boxName);
    await box.put(model.id, model);
  }

  @override
  Future<List<ProductModel>> getProduct() async {
    final box = await Hive.openBox<ProductModel>(_boxName);
    return box.values.toList();
  }
}
