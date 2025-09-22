import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? suffixImage; // changed from IconData
  final String? prefixImage; // changed from IconData
  final String? labelText;

  const TextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffixImage,
    this.prefixImage,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQuery values
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.01),
            child: Text(
              labelText!,
              style: GoogleFonts.sen(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        Container(
          height: screenHeight * 0.07,
          width: screenWidth * 0.88,
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFF6F6F6)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.sen(
                fontSize: screenWidth * 0.035,
                color: Colors.grey.shade600,
              ),

              // ✅ Use asset images here
              prefixIcon: prefixImage != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 0), // adjust size
                      child: Image.asset(
                        prefixImage!,
                        color: Colors.grey.shade600,
                      ),
                    )
                  : null,
              suffixIcon: suffixImage != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        suffixImage!,
                        color: Colors.grey.shade600,
                      ),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              filled: true,
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
