import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class PaymentMethodTextField extends StatelessWidget {
  const PaymentMethodTextField(
      {super.key,
      required this.lable,
      this.controller,
      this.preffixText = '',
      this.enabled = true});

  final String lable;
  final TextEditingController? controller;
  final bool enabled;
  final String preffixText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        margin: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: MediaQuery.of(context).size.width < 750 ? 8 : 25.0),
        color: Colors.white,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.griid,
                ),
              ),
              labelText: lable,
              labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontFamily: 'ReadexPro',
                  fontWeight: FontWeight.w300),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  preffixText,
                  style: const TextStyle(
                      fontFamily: 'ReadexPro',
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
          ),
        ),
      ),
    );
  }
}
