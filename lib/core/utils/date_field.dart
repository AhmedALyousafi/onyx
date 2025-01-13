import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class DateField extends StatelessWidget {
  final String label;

  const DateField(String s, {super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.griid),
            ),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
            suffixIcon: Icon(
              Icons.calendar_month,
              color: Color(0xff819AA7),
            ),
            border: UnderlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
      ),
    );
  }
}
