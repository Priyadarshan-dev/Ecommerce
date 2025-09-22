import 'package:flutter/material.dart';

class ShoesProducts extends StatelessWidget {
  const ShoesProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text("Shoes ${index + 1}")),
        );
      },
    );
  }
}
