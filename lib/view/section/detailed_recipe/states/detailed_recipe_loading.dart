import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailedRecipeScreenLoading extends StatelessWidget {
  const DetailedRecipeScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints:  BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child: ListView(
              children: [
                ...List.generate(9, (index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
