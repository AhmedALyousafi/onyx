import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../warehouse_information/inputFormScreen .dart';

class TapScreen extends StatelessWidget {
  const TapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Inputformscreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
