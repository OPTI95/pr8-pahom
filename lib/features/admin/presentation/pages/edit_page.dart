import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr8/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';

class EditProductPage extends StatelessWidget {
  final int id;
  final TextEditingController name;
  final TextEditingController price;
  final TextEditingController count;
  const EditProductPage(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EditProductCard(
          id: id,
          name: name,
          price: price,
          count: count,
        ),
      ),
    );
  }
}

class EditProductCard extends StatelessWidget {
  const EditProductCard({
    super.key,
    required this.name,
    required this.id,
    required this.price,
    required this.count,
  });
  final int id;
  final TextEditingController name;
  final TextEditingController price;
  final TextEditingController count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Название"),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(labelText: "Цена"),
              ),
              TextField(
                controller: count,
                decoration: InputDecoration(labelText: "Колисчество"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () async {
                        await context.read<AdminCubit>().deleteProduct(Product(
                            id: id,
                            price: int.parse(price.text),
                            name: name.text,
                            count: int.parse(count.text)));
                      },
                      icon: Icon(Icons.remove)),
                  IconButton(
                    onPressed: () async {
                      await context.read<AdminCubit>().putExProduct(Product(
                          id: id,
                          price: int.parse(price.text),
                          name: name.text,
                          count: int.parse(count.text)));
                    },
                    icon: Icon(Icons.done),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
