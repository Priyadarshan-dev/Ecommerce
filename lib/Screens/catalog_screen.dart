import 'package:ecommerce/Products/all_products.dart';
import 'package:ecommerce/Products/jeans_products.dart';
import 'package:ecommerce/Products/shoes_product.dart';
import 'package:ecommerce/Products/tshirts_products.dart';
import 'package:ecommerce/Widgets/text_form.dart';
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

  // Placeholder products
  final List<Map<String, String>> products = <Map<String, String>>[
    <String, String>{"name": "Blue Tshirt", "category": "Tshirts"},
    <String, String>{"name": "Red Jeans", "category": "Jeans"},
    <String, String>{"name": "White Shoes", "category": "Shoes"},
    <String, String>{"name": "Green Tshirt", "category": "Tshirts"},
    <String, String>{"name": "Black Shoes", "category": "Shoes"},
  ];

  List<Map<String, String>> get displayedProducts {
    if (selectedCategory == "All") return products;
    return products.where((p) => p["category"] == selectedCategory).toList();
  }

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
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discover",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset('assets/images/Bell.png'),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.0),
              Row(
                children: [
                  Expanded(
                    child: TextForm(
                      controller: search,
                      hintText: 'Search for clothes',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Image.asset("assets/images/Filter.png"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Category Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => setState(() => selectedCategory = "All"),
                    child: Container(
                      height: 36,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedCategory == "All"
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: selectedCategory == "All"
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => selectedCategory = "Tshirts"),
                    child: Container(
                      height: 36,
                      width: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedCategory == "Tshirts"
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "Tshirts",
                          style: TextStyle(
                            color: selectedCategory == "Tshirts"
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => selectedCategory = "Jeans"),
                    child: Container(
                      height: 36,
                      width: 86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedCategory == "Jeans"
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "Jeans",
                          style: TextStyle(
                            color: selectedCategory == "Jeans"
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => selectedCategory = "Shoes"),
                    child: Container(
                      height: 36,
                      width: 87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedCategory == "Shoes"
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "Shoes",
                          style: TextStyle(
                            color: selectedCategory == "Shoes"
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: selectedCategory == "All"
                    ? const AllProducts()
                    : selectedCategory == "Tshirts"
                    ? const TshirtsProducts()
                    : selectedCategory == "Jeans"
                    ? const JeansProducts()
                    : const ShoesProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
