import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr8/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:pr8/features/product/domain/entities/product_entity.dart';

class AddProductPage extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController count = TextEditingController();
  AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                    IconButton(
                      onPressed: () async {
                        Random random = Random();
                        int id = random.nextInt(1000000000);
                        await context.read<AdminCubit>().addNewProduct(Product(
                            id: 0,
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
      ),
    );
  }
}
