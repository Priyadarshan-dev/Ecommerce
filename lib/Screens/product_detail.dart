import 'package:ecommerce/Models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text("Details"),
                  Icon(Icons.notification_important),
                ],
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(height: 368, width: 341, color: Colors.grey.shade300),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [Icon(Icons.star), Text("4.0")]),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "The name says it all, the right size slightly sougs\nthe body leaving enough room for comfort in \n the sleeves and waist",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Choose Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Container(
                    height: 47,
                    width: 50,
                    color: Colors.grey.shade200,
                    child: Center(child: Text("S")),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 47,
                    width: 50,
                    color: Colors.grey.shade200,
                    child: Center(child: Text("M")),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 47,
                    width: 50,
                    color: Colors.grey.shade200,
                    child: Center(child: Text("L")),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade200),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [Text("Price"), Text("\$ 1,190")]),
                SizedBox(width: 30),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 240,
                    height: 54,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
