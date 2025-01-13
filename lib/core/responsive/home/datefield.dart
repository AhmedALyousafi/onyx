import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class Datefield extends StatelessWidget {
  const Datefield({super.key, required this.lable});
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.griid)),
              labelText: lable,
              labelStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xff819AA7),
              ),
              suffixIcon: const Icon(
                Icons.calendar_month,
                color: Color(0xff819AA7),
              ),
              border: const UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
          ),
        ),
      ),
    );
  }
}
