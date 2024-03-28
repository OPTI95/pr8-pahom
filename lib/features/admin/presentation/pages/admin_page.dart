import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr8/features/admin/presentation/pages/add_page.dart';
import 'package:pr8/features/admin/presentation/pages/edit_page.dart';

import '../cubit/admin_cubit.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});
  TextEditingController name = TextEditingController(text: "Груша");
  TextEditingController price = TextEditingController(text: "100");
  TextEditingController count = TextEditingController(text: "30000");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddProductPage()));
          },
          icon: Icon(Icons.add),
        ),
        title: Text("Админ"),
      ),
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          if (state is AdminProductLoaded) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return EditProductPage(
                              id: state.list[index].id,
                              name: TextEditingController(
                                  text: state.list[index].name),
                              price: TextEditingController(
                                  text: state.list[index].price.toString()),
                              count: TextEditingController(
                                  text: state.list[index].count.toString()));
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(state.list[index].name),
                    subtitle: Text("Количество: ${state.list[index].count}"),
                    leading: Text("${state.list[index].price}Р"),
                  ),
                );
              },
            );
          } else if (state is AdminInitial) {
            context.read<AdminCubit>().fetchProductList();
            return SizedBox();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
