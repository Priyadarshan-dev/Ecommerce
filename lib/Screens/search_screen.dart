import 'package:ecommerce/Screens/product_detail.dart';
import 'package:ecommerce/Widgets/text_form.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = TextEditingController();
  List<Product> searchProducts = []; // Start empty

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "assets/images/left.png",
                      height: screenHeight * 0.03,
                    ),
                  ),
                  Text(
                    "Search",
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

            TextForm(
              onChanged: searchProduct,
              controller: search,
              hintText: 'Search for Clothes...',
              obscureText: false,
            ),

            Expanded(
              child: search.text.isEmpty
                  ? Center(
                      child: Text(
                        "Start typing to search products",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.045,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : searchProducts.isEmpty
                  ? Center(
                      child: Text(
                        "No results found",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.045,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchProducts.length,
                      itemBuilder: (context, index) {
                        final product = searchProducts[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 8,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Hero(
                                tag: 'product_image_${product.id}', // ADDED HERO
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    product.image,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                product.title,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                "\$${product.price}",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailScreen(product: product),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      setState(() => searchProducts = []);
      return;
    }

    final suggestion = allProducts.where((product) {
      final productTitle = product.title.toLowerCase();
      final input = query.toLowerCase();
      return productTitle.contains(input);
    }).toList();

    setState(() => searchProducts = suggestion);
  }
}