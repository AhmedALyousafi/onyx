import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
    String s, {
    super.key,
    required this.lable,
  });
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField2<String>(
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.griid)),
              contentPadding: EdgeInsets.all(0)),
          iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
          dropdownStyleData: const DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero),
          hint: Text(
            lable,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          items: const [
            DropdownMenuItem(
              child: Text("Option 1"),
              value: "1",
            ),
            DropdownMenuItem(
              child: Text("Option 2"),
              value: "2",
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
