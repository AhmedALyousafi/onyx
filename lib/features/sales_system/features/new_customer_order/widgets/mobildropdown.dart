import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class MobileTextFieldWidget extends StatelessWidget {
  const MobileTextFieldWidget({
    super.key,
    required this.lable,
    this.controller,
    this.enabled = false,
    this.fillColor = Colors.white,
  });

  final String lable;
  final TextEditingController? controller;
  final bool enabled;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.griid,
              ),
            ),
            labelText: lable,
            labelStyle: const TextStyle(
                fontSize: 12,
                color: Color(0xFF819AA7),
                fontFamily: 'ReadexPro',
                fontWeight: FontWeight.w300),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(''),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          ),
        ),
      ),
    );
  }
}
