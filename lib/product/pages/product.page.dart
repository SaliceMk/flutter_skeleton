import 'package:flutter/material.dart';
import 'package:flutter_skeleton/product/widgets/users.view.dart';

import '../product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: const ProductLoaderView(child: ProductBody()),
      floatingActionButton: FloatingActionButton(
        child: Text('Users'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UsersView(),
            ),
          );
        },
      ),
    );
  }
}
