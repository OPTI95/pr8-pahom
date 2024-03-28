import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Корзина"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (con, index) {
          return ListTile(
            title: Text("Груша"),
            subtitle: Text("Количество: 100"),
            leading: Text("50Р"),
            trailing: Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
