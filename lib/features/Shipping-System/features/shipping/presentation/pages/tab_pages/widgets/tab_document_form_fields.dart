//بيانات اخرى

import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/home/dropdown_field.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/utils/date_field.dart';
import 'package:onyx/core/utils/responsive_utils.dart';

class DocumentFormFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AdaptiveLayout(
        desktopLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const DropdownField(
                      '',
                      lable: 'نوع الناقل',
                    ),
                    const DropdownField(
                      '',
                      lable: 'الشركة الناقلة',
                    ),
                    buildTextField("ميناء الوصول"),
                    const DropdownField(
                      '',
                      lable: 'ميناء الشحن',
                    ),
                    buildTextField("وحدة الشحن"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField(
                      "رقم التعهد",
                    ),
                    const Expanded(
                      child: DateField(
                        "",
                        label: 'تاريخ التعهد',
                      ),
                    ),
                    buildTextField("مكان التسليم"),
                    const Expanded(
                      child: DateField(
                        "",
                        label: 'تاريخ التسليم',
                      ),
                    ),
                    buildTextField("سعر وحدة الشحن"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const DropdownField(
                      '',
                      lable: 'عملة الشحن',
                    ),
                    buildTextField("خط الشحن"),
                    const DropdownField(
                      '',
                      lable: 'ميناء الشحن',
                    ),
                    const DropdownField(
                      '',
                      lable: 'بلد المنشأ',
                    ),
                    const DropdownField(
                      '',
                      lable: 'بلد التصدير',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField(
                      "تاريخ انتهاء التعهد",
                    ),
                    const DropdownField(
                      '',
                      lable: 'شروط التسليم',
                    ),
                    const DropdownField(
                      '',
                      lable: 'شروط الدفع',
                    ),
                    buildTextField("مبلغ الشحن"),
                    buildTextField("اخر موعد للشحن"),
                  ],
                ),
              ],
            ),
          ),
        ),
        tabletLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const DropdownField(
                      '',
                      lable: 'نوع الناقل',
                    ),
                    const DropdownField(
                      '',
                      lable: 'الشركة الناقلة',
                    ),
                    buildTextField("ميناء الوصول"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const DropdownField(
                      '',
                      lable: 'ميناء الشحن',
                    ),
                    buildTextField("وحدة الشحن"),
                    buildTextField("رقم التعهد"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("مكان التسليم"),
                    const Expanded(
                      child: DateField(
                        "",
                        label: 'تاريخ التسليم',
                      ),
                    ),
                    buildTextField("سعر وحدة الشحن"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const DropdownField(
                      '',
                      lable: 'عملة الشحن',
                    ),
                    buildTextField("خط الشحن"),
                    const DropdownField(
                      '',
                      lable: 'ميناء الشحن',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField(
                      "تاريخ انتهاء التعهد",
                    ),
                    const DropdownField(
                      '',
                      lable: 'بلد المنشأ',
                    ),
                    const DropdownField(
                      '',
                      lable: 'بلد التصدير',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const DropdownField(
                      '',
                      lable: 'شروط التسليم',
                    ),
                    const DropdownField(
                      '',
                      lable: 'شروط الدفع',
                    ),
                    buildTextField("مبلغ الشحن"),
                    buildTextField("اخر موعد للشحن"),
                  ],
                ),
              ],
            ),
          ),
        ),
        mobileLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const DropdownField(
                  '',
                  lable: 'نوع الناقل',
                ),
                const DropdownField(
                  '',
                  lable: 'الشركة الناقلة',
                ),
                buildTextField("ميناء الوصول"),
                const DropdownField(
                  '',
                  lable: 'ميناء الشحن',
                ),
                buildTextField("وحدة الشحن"),
                buildTextField(
                  "رقم التعهد",
                ),
                const Expanded(
                  child: DateField(
                    "",
                    label: 'تاريخ التعهد',
                  ),
                ),
                buildTextField("مكان التسليم"),
                const Expanded(
                  child: DateField(
                    "",
                    label: 'تاريخ التسليم',
                  ),
                ),
                buildTextField("سعر وحدة الشحن"),
                const DropdownField(
                  '',
                  lable: 'عملة الشحن',
                ),
                buildTextField("خط الشحن"),
                const DropdownField(
                  '',
                  lable: 'ميناء الشحن',
                ),
                const DropdownField(
                  '',
                  lable: 'بلد المنشأ',
                ),
                const DropdownField(
                  '',
                  lable: 'بلد التصدير',
                ),
                buildTextField(
                  "تاريخ انتهاء التعهد",
                ),
                const DropdownField(
                  '',
                  lable: 'شروط التسليم',
                ),
                const DropdownField(
                  '',
                  lable: 'شروط الدفع',
                ),
                buildTextField("مبلغ الشحن"),
                buildTextField("اخر موعد للشحن"),
              ],
            ),
          ),
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
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
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
            padding: const EdgeInsets.only(left: 4),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.griid)),
                  labelText: label,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff819AA7),
                  )),
            )),
      ),
    );
  }

  Widget buildDropdownMenu(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Expanded(
        child: DropdownButton<String>(
          hint: Text(title),
          items: [
            const DropdownMenuItem(
              value: "Option1",
              child: Text("Option 1"),
            ),
            const DropdownMenuItem(
              value: "Option2",
              child: Text("Option 2"),
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
