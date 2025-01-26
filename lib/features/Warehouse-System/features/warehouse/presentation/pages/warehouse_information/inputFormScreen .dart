import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/core/responsive/adaptivelayout.dart';
import 'package:onyx/features/Warehouse-System/cubit/cubit.dart';
import 'package:onyx/features/Warehouse-System/cubit/state.dart';

import 'pluto_grid.dart';

void main() {
  runApp(Inputformscreen());
}

class Inputformscreen extends StatefulWidget {
  @override
  State<Inputformscreen> createState() => _InputformscreenState();
}

class _InputformscreenState extends State<Inputformscreen> {
  bool unapprovedFilter = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseSystemCubit, WarehouseSystemState>(
        builder: (context, state) {
      return AdaptiveLayout(
        desktopLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(
                      "تاريخ الوثيقة *",
                    ),
                    buildTextField("رقم الوثيقة *"),
                    buildDropdownField("نوع الوثيقة الفرعي *"),
                    buildDropdownField("الوحدة المالية *"),
                    buildTextField("السنة *"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("رقم الحساب الوسيط*"),
                    buildDateField("تاريخ الاستحقاق  "),
                    buildDropdownField("الي مخزن*"),
                    buildDropdownField("من مخزن*"),
                    buildDateField("التاريخ اليدوي *"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("البيان "),
                    buildTextField("السبب "),
                    buildDropdownField("مستوئ التسعير"),
                    buildDropdownField2("طريقة تكاليف التحويل *"),
                    buildDropdownField("نوع الاستلام"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("اجمالي الفارق"),
                    buildDropdownField("رقم حساب الفارق للتحويل السابق"),
                    buildTextField("اجمالي الفارق"),
                    buildDropdownField("رقم حساب الفارق"),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildCheckbox(
                        context, 'انزال الكمية المتوفرة', unapprovedFilter,
                        (newValue) {
                      setState(() {
                        unapprovedFilter = newValue!; // تحديث الحالة عند النقر
                      });
                    }),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile("بيانات اخرى")),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CustomGrid1(),
                  ),
                ),
              ],
            ),
          ),
        ),
        tabletLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(
                      "تاريخ الوثيقة *",
                    ),
                    buildTextField("رقم الوثيقة *"),
                    buildDropdownField("نوع الوثيقة الفرعي *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("الوحدة المالية *"),
                    buildTextField("السنة *"),
                    buildTextField("تاريح الاستحقاق"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("رقم الحساب الوسيط*"),
                    buildDropdownField("الي مخزن*"),
                    buildDropdownField("من مخزن*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("التاريخ اليدوي*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("البيان *", isLocked: true),
                    buildDropdownField("تصنيف الضريبة*"),
                    buildDateField(" تاريخ الاستحقاق *"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile("بيانات اخرى")),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CustomGrid1(),
                  ),
                ),
              ],
            ),
          ),
        ),
        mobileLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(
                      "تاريخ الوثيقة *",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("نوع الوثيقة الفرعي *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("الوحدة المالية *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("السنة *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("سعر التحويل"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("العملة*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("رقم العميل *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("رقم المخزن *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("التاريخ اليدوي*"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("البيان *", isLocked: true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("تصنيف الضريبة*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(" تاريخ الاستحقاق *"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile("بيانات اخري")),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CustomGrid1(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
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
                  borderSide: BorderSide(color: Color(0xffd6d6d6))),
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
                )),
          )),
    ),
  );
}

Widget buildDropdownMenu(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Expanded(
      child: DropdownButton<String>(
        hint: Text(title),
        items: [
          DropdownMenuItem(
            value: "Option1",
            child: Text("Option 1"),
          ),
          DropdownMenuItem(
            value: "Option2",
            child: Text("Option 2"),
          ),
        ],
        onChanged: (value) {},
      ),
    ),
  );
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

Widget buildExpansionTile(String title) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                buildTextField('رقم المرجع'),
                buildTextField('الرقم اليدوي '),
                buildTextField('عدد المرفقات'),
                buildDropdownField('رقم السائق'),
                buildTextField('رقم السياة'),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTableHeader(String title) {
  return Expanded(
    child: Text(
      title,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.end,
    ),
  );
}

Widget buildDropdownField(String label) {
  return Expanded(
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: DropdownButtonFormField2<String>(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffd6d6d6))),
              contentPadding: EdgeInsets.all(0)),
          iconStyleData: IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            iconEnabledColor: Color(0xff819AA7),
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.zero),
          hint: Text(
            textAlign: TextAlign.left,
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
          ),
          items: [
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
    ),
  );
}

Widget buildDropdownField2(String label) {
  return Expanded(
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: DropdownButtonFormField2<String>(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd6d6d6)),
            ),
            contentPadding: EdgeInsets.all(0),
          ),
          iconStyleData: IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            iconEnabledColor: Color(0xff819AA7),
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          hint: Text(
            textAlign: TextAlign.left,
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
          ),
          items: [
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "متوسط التكلفة",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              value: "1",
            ),
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "آخر سعر توريد",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              value: "2",
            ),
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "سعر البيع",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              value: "3",
            ),
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "آخر سعر شراء",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              value: "4",
            ),
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "سعر تكلفة الاستلام المخزني",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              value: "5",
            ),
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "آخر سعر إنتاج/توريد",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              value: "6",
            ),
          ],
          onChanged: (value) {
            print("Selected Value: $value");
          },
        ),
      ),
    ),
  );
}

Widget _buildExecuteButton() {
  return Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            size: 20,
          ),
          label: Text('اضافة منتج'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
    ],
  );
}

Widget _buildExecuteButton2() {
  return Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.refresh_outlined,
            size: 20,
          ),
          label: Text('مسح البيانات'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
        ),
      ),
    ],
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
              scale: 0.8, child: Checkbox(value: value, onChanged: onChanged))),
    ],
  );
}
