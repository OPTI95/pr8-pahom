import 'package:hive/hive.dart';
import 'package:pr8/features/product/data/models/product_model.dart';

class ProductAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    return ProductModel(
      id: reader.readInt(),
      name: reader.readString(),
      price: reader.readInt(),
      count: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeInt(obj.price);
    writer.writeInt(obj.count ?? 0);
  }
}
