import 'package:flutter/material.dart';

class TshirtsProducts extends StatelessWidget {
  const TshirtsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 2,
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
          child: Center(child: Text("Tshirt ${index + 1}")),
        );
      },
    );
  }
}
