import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/datafrom.dart';
import 'package:onyx/features/sales_system/input_form_screen%20.dart';

class Main10 extends StatelessWidget {
  const Main10({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          const CheckBoxItem(),
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
