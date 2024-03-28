import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr8/features/product/presentation/cubit/product_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Продукты"),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        if (state is ProductLoaded) {
          return ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.list[index].name),
                subtitle: Text("Количество: ${state.list[index].count}"),
                leading: Text("${state.list[index].price}Р"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              );
            },
          );
        } else if (state is ProductInitial) {
          context.read<ProductCubit>().fetchProductList();
          return SizedBox();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
