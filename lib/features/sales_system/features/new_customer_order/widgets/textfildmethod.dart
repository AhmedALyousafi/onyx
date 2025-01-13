import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class TextFieldPaymentmethodWidget extends StatelessWidget {
  const TextFieldPaymentmethodWidget(
      {super.key,
      required this.lable,
      this.controller,
      this.preffixText = '',
      this.enabled = false});

  final String lable;
  final TextEditingController? controller;
  final bool enabled;
  final String preffixText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 6,
          right: MediaQuery.of(context).size.width < 750 ? 15 : 10,
        ),
        child: Container(
          height: 40,
          color: Colors.white,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: controller,
              enabled: enabled,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.griid,
                  ),
                ),
                labelText: lable,
                labelStyle: const TextStyle(
                    color: Color(0xFF819AA7),
                    fontSize: 12,
                    fontFamily: 'ReadexPro',
                    fontWeight: FontWeight.w300),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    preffixText,
                    style: const TextStyle(
                        color: Color(0xFF474747),
                        fontFamily: 'ReadexPro',
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
