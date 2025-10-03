import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/Provider/cart_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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
                    "My Orders",
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

            Expanded(
              child: cartProvider.orders.isEmpty
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
                            "No Orders Yet!",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "Your orders will appear here.",
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
                        itemCount: cartProvider.orders.length,
                        itemBuilder: (context, orderIndex) {
                          final order = cartProvider.orders[orderIndex];
                          
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Order Header
                              Padding(
                                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                child: Text(
                                  "Order #${orderIndex + 1} - \$${order.total.toStringAsFixed(2)}",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              
                              // Order Date
                              Padding(
                                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                child: Text(
                                  "Ordered on: ${order.date.day}/${order.date.month}/${order.date.year}",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              
                              // List of ordered items
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: order.items.length,
                                itemBuilder: (context, itemIndex) {
                                  final product = order.items[itemIndex];
                                  
                                  return Container(
                                    margin: EdgeInsets.only(
                                      bottom: screenHeight * 0.01,
                                    ),
                                    height: screenHeight * 0.1,
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
                                              height: screenHeight * 0.08,
                                              width: screenWidth * 0.18,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.03),

                                        // Product Info
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                "Qty: ${product.quantity} • \$${(product.price * product.quantity).toStringAsFixed(2)}",
                                                style: GoogleFonts.poppins(
                                                  fontSize: screenWidth * 0.035,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              
                              // Order Separator
                              Container(
                                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                                height: 1,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}