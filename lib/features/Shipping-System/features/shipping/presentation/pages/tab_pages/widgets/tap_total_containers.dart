import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/tab_pages/widgets/tap_table_total_containers.dart';

import 'package:flutter/material.dart';

class TapTotalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              buildTextField(
                "عدد الحاويات",
              ),
            ]),
            TableWidget(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildCheckInputField(String label, String amountLabel,
      {bool checkbox = false}) {
    return Expanded(
      child: Row(
        children: [
          if (checkbox)
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          Text(label),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.griid)),
                labelText: amountLabel,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, {bool isLocked = false}) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.griid)),
                  labelText: label,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xff819AA7),
                  )),
            )),
      ),
    );
  }
}
