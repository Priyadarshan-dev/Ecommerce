import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/Provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    "My Cart",
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Divider(color: Colors.grey.shade300),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Cart Body
            Expanded(
              child: cartProvider.cartItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/cart.png",
                            height: screenHeight * 0.1,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "Your cart is Empty!",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "When you add Products They\nwill Appear here.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: ListView.builder(
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final product = cartProvider.cartItems[index];
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: screenHeight * 0.02,
                            ),
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                // Product Image
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.03,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      product.image,
                                      height: screenHeight * 0.09,
                                      width: screenWidth * 0.2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: screenHeight * 0.005),
                                      Text(
                                        product.category,
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.005),
                                      Text(
                                        "\$${product.price.toStringAsFixed(2)}",
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Quantity Controls and Trash Icon
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Trash Icon
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: screenHeight * 0.03,
                                        right: screenWidth * 0.02,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          cartProvider.removeFromCart(index);
                                        },
                                        child: Image.asset(
                                          "assets/images/trash.png",
                                          height: screenHeight * 0.025,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),

                                    // Plus/Minus Quantity Controls
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          // Minus Button
                                          InkWell(
                                            onTap: () {
                                              cartProvider.decreaseQuantity(
                                                index,
                                              );
                                            },
                                            child: Container(
                                              width: screenWidth * 0.07,
                                              height: screenHeight * 0.03,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                size: screenWidth * 0.04,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),

                                          // Quantity Number
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.02,
                                            ),
                                            child: Text(
                                              "${product.quantity}",
                                              style: GoogleFonts.poppins(
                                                fontSize: screenWidth * 0.04,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          // Plus Button
                                          InkWell(
                                            onTap: () {
                                              cartProvider.increaseQuantity(
                                                index,
                                              );
                                            },
                                            child: Container(
                                              width: screenWidth * 0.07,
                                              height: screenHeight * 0.03,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                size: screenWidth * 0.04,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
            if (cartProvider.cartItems.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    // Sub-total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub-total",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "\$ ${cartProvider.getTotalPrice().toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    // Shipping fee - now dynamic
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping fee",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          cartProvider.getShippingFee() == 0
                              ? "Free"
                              : "\$ ${cartProvider.getShippingFee().toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                            color: cartProvider.getShippingFee() == 0
                                ? Colors.green
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Divider
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: screenHeight * 0.01),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "\$ ${cartProvider.getGrandTotal().toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Checkout Button
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          cartProvider.placeOrder();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Place Order",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
