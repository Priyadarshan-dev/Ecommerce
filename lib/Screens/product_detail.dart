import 'package:ecommerce/Provider/cart_provider.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<CartProvider>(
      builder: (BuildContext context, CartProvider cart, Widget? child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/left.png",
                          height: screenHeight * 0.03,
                        ),
                      ),
                      Text(
                        "Product Details",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Image.asset(
                        "assets/images/share.png",
                        height: screenHeight * 0.025,
                      ),
                    ],
                  ),
                ),

                Stack(
                  children: [
                    // HERO ANIMATION ADDED HERE
                    Hero(
                      tag: 'product_image_${product.id}', // MUST MATCH other screens
                      child: Container(
                        height: screenHeight * 0.35,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset(product.image, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.02,
                      right: screenWidth * 0.05,
                      child: Image.asset(
                        "assets/images/heart.png",
                        height: screenHeight * 0.025,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenHeight * 0.02,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.07,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenHeight * 0.01,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/star.png",
                        height: screenHeight * 0.025,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        "4.0/5",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        "(45 Reviews)",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenHeight * 0.02,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenHeight * 0.03,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Choose Size",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenHeight * 0.02,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            "S",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Container(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            "M",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Container(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            "L",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),
                Divider(thickness: 1, color: Colors.grey.shade200),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "\$${product.price.toString()}",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          cart.addToCart(product);
                        },
                        child: Container(
                          height: screenHeight * 0.065,
                          width: screenWidth * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "Add to Cart",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}