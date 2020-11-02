import 'package:flutter/material.dart';
import 'package:ordervida_restaurant/helpers/style.dart';
import 'package:ordervida_restaurant/providers/user.dart';
import 'package:ordervida_restaurant/widgets/custom_text.dart';
import 'package:ordervida_restaurant/widgets/product.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Products"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body:               Column(
        children: userProvider.products
            .map((item) => GestureDetector(
          onTap: () {
//                    changeScreen(context, Details(product: item,));
          },
          child: ProductWidget(
            product: item,
          ),
        ))
            .toList(),
      ),
    );
  }
}
