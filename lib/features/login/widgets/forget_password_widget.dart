import 'package:flutter/material.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/view/custome_request.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.80,
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  CustomeRequest(),
            ),
          )
        },
        child: const Text(
          'Forget password?',
          style: TextStyle(
            color: Color(0xff939393),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
