import 'package:flutter/material.dart';

class DocumentImageContainer extends StatelessWidget {
  final String imagePath;

  const DocumentImageContainer({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Center(
        child: Image.network(
          'https://cdn.builder.io/api/v1/image/assets/d9a9351b029f411597560cda7573d104/116b68ed2adf8ef3bf638bd3b29cc52e03453659934135ea1a092c3261a70df3?apiKey=385d7c7995b945168b67525b6f6a96fa&',
          width: 285,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const CircularProgressIndicator();
          },
          semanticLabel: 'Decorative image',
        ),
      ),
    );
  }
}
