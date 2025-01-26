import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class TapInsurance extends StatefulWidget {
  @override
  State<TapInsurance> createState() => _TapInsuranceState();
}

class _TapInsuranceState extends State<TapInsurance> {
  bool unapprovedFilter = false;
  bool unapprovedFilter2 = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildDropdown('نوع انزال الوثيقة'),
                ),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('رقم الوثيقة المرجعية')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('تاريخ الوثيقة المرجعية')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('نوع الوثيقة')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('النوع ')),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildDropdown('سياسة مقارنة الكميات')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('الحد الاقصئ لعدد السجلات')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('تحديث العرض بعد الانزال')),
                SizedBox(width: 30),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildCheckbox(
                          context,
                          'انزال الكميات المتوفرة لهذة المخزن',
                          unapprovedFilter, (newValue) {
                        setState(() {
                          unapprovedFilter =
                              newValue!; // تحديث الحالة عند النقر
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  width: 550,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildCheckbox(
                          context,
                          'السماح للمستخدم بالغاء عملية التنزيل',
                          unapprovedFilter2, (newValue) {
                        setState(() {
                          unapprovedFilter2 =
                              newValue!; // تحديث الحالة عند النقر
                        });
                      }),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildExecuteButton(), // زر تنفيذ
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffd6d6d6))),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField2<String>(
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffd6d6d6))),
            contentPadding: EdgeInsets.all(10)),
        iconStyleData:
            IconStyleData(icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.zero,
        ),
        menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.zero),
        hint: Text(
          label,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        items: [
          DropdownMenuItem(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("وثائق مراقبة"),
            ),
            value: "1",
          ),
          DropdownMenuItem(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("وثائق غير مراقبة"),
            ),
            value: "2",
          ),
        ],
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildExecuteButton() {
    return Align(
      alignment: Alignment.centerRight, // لمحاذاة الزر لليمين
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.sim_card_download,
          size: 24,
        ),
        label: Text(
          'تنفيذ',
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green, // اللون الأخضر
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // حواف مستديرة
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(
    BuildContext context,
    String label,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Row(
      children: [
        Text(label),
        Theme(
            data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    side: const BorderSide(
                      color: Color(0xffe2e2e2),
                      width: 0,
                    ))),
            child: Transform.scale(
                scale: 0.8,
                child: Checkbox(value: value, onChanged: onChanged))),
      ],
    );
  }
}

Widget buildDateField(String label) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffd6d6d6))),
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
    ),
  );
}
