import 'package:ecommerce/Products/all_products.dart';
import 'package:ecommerce/Products/hoodies_poducts.dart';
import 'package:ecommerce/Products/shoes_products.dart';
import 'package:ecommerce/Products/tshirts_products.dart';
import 'package:ecommerce/Screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final search = TextEditingController();
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discover",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      'assets/images/Bell.png',
                      height: screenHeight * 0.035,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: screenHeight * 0.065,
                        width: screenWidth * 0.55,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            right: screenWidth * 0.03,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Search.png",
                                height: screenHeight * 0.03,
                              ),
                              Text(
                                "Search here ...",
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Container(
                    height: screenHeight * 0.065,
                    width: screenWidth * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/Filter.png",
                        height: screenHeight * 0.025,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              // Category Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => setState(() => selectedCategory = "All"),
                      child: Container(
                        height: screenHeight * 0.045,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          color: selectedCategory == "All"
                              ? Colors.black
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: selectedCategory == "All"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    InkWell(
                      onTap: () => setState(() => selectedCategory = "Tshirts"),
                      child: Container(
                        height: screenHeight * 0.045,
                        width: screenWidth * 0.26,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          color: selectedCategory == "Tshirts"
                              ? Colors.black
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/tag1.png",
                              height: 25,
                              color: selectedCategory == "Tshirts"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              "Tshirts",
                              style: GoogleFonts.poppins(
                                color: selectedCategory == "Tshirts"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    InkWell(
                      onTap: () => setState(() => selectedCategory = "Hoodies"),
                      child: Container(
                        height: screenHeight * 0.045,
                        width: screenWidth * 0.30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          color: selectedCategory == "Hoodies"
                              ? Colors.black
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/tag.png",
                              height: 25,
                              color: selectedCategory == "Hoodies"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              "Hoodies",
                              style: GoogleFonts.poppins(
                                color: selectedCategory == "Hoodies"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    InkWell(
                      onTap: () => setState(() => selectedCategory = "Shoes"),
                      child: Container(
                        height: screenHeight * 0.045,
                        width: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          color: selectedCategory == "Shoes"
                              ? Colors.black
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/tag2.png",
                              height: 25,
                              color: selectedCategory == "Shoes"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              "Shoes",
                              style: GoogleFonts.poppins(
                                color: selectedCategory == "Shoes"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              Expanded(
                child: selectedCategory == "All"
                    ? const AllProducts()
                    : selectedCategory == "Tshirts"
                    ? const TshirtsProducts()
                    : selectedCategory == "Hoodies"
                    ? const HoodiesPoducts()
                    : const ShoesProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
