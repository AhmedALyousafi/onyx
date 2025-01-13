import 'package:onyx/core/cubit/cubit.dart';
import 'package:onyx/core/cubit/state.dart';
import 'package:onyx/core/responsive/home/dropdown_field.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/utils/date_field.dart';
import 'package:onyx/core/utils/responsive.dart';
import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/shipping%20information/pluto_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Shipingiputformscreen());
}

class Shipingiputformscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(builder: (context, state) {
      return AdaptiveLayout(
        desktopLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DateField(
                        "",
                        label: 'تاريخ الوثيقة *',
                      ),
                    ),
                    buildTextField("رقم الوثيقة *"),
                    DropdownField(
                      "",
                      lable: 'نوع الوثيقة الفرعي *',
                    ),
                    DropdownField(
                      "",
                      lable: 'الوحدة المالية *',
                    ),
                    buildTextField("السنة *"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownField(
                      "",
                      lable: 'رقم بوصلة الشحن*',
                    ),
                    buildTextField("سعر التحويل  *"),
                    DropdownField(
                      "",
                      lable: 'العملة*',
                    ),
                    DropdownField(
                      "",
                      lable: 'رقم المورد*',
                    ),
                    DropdownField(
                      "",
                      lable: 'رقم أمر الشراء *',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DateField(
                        "",
                        label: 'تاريخ فاتورة المورد *',
                      ),
                    ),
                    buildTextField("رقم فاتورة المورد *"),
                    DropdownField(
                      "",
                      lable: 'رقم المخزن*',
                    ),
                    DropdownField(
                      "",
                      lable: 'طريقة الشحن *',
                    ),
                    Expanded(
                        child: DateField(
                      "",
                      label: 'تاريخ الشحن*',
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("البيان"),
                    buildTextField("نوع الشحن"),
                    buildTextField("نوع البوصلة"),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'الاستلام جزئي',
                      style: TextStyle(fontSize: 14, color: Color(0xFF474747)),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(value: false, onChanged: (value) {}),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.grid,
                    ),
                    child: buildExpansionTile("بيانات اخرى")),
                SizedBox(
                  height: 20,
                ),

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.grid,
                    ),
                    child: buildExpansionTile2("الأصناف")),
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
                    Expanded(
                      child: DateField(
                        "",
                        label: 'تاريخ الوثيقة *',
                      ),
                    ),
                    buildTextField("رقم الوثيقة *"),
                    DropdownField(
                      "",
                      lable: 'نوع الوثيقة الفرعي *',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownField(
                      "",
                      lable: 'الوحدة المالية *',
                    ),
                    buildTextField("السنة *"),
                    buildTextField("سعر التحويل"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("العملة*"),
                    buildTextField("رقم العميل *"),
                    DropdownField(
                      "",
                      lable: 'رقم المخزن *',
                    ),
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
                    DropdownField(
                      "",
                      lable: 'تصنيف الضريبة*',
                    ),
                    Expanded(
                        child: DateField(
                      " ",
                      label: 'تاريخ الاستحقاق *',
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.grid,
                    ),
                    child: buildExpansionTile("بيانات اخرى")),
                SizedBox(
                  height: 20,
                ),

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.grid,
                    ),
                    child: buildExpansionTile2("الأصناف")),
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
                Expanded(
                    child: DateField(
                  "",
                  label: 'تاريخ الوثيقة *',
                )),
                DropdownField(
                  "",
                  lable: 'نوع الوثيقة الفرعي *',
                ),
                DropdownField(
                  "",
                  lable: 'الوحدة المالية *',
                ),
                buildTextField("السنة *"),
                buildTextField("سعر التحويل"), buildTextField("العملة*"),
                buildTextField("رقم العميل *"),
                DropdownField(
                  "",
                  lable: 'رقم المخزن *',
                ),
                buildTextField("التاريخ اليدوي*"),
                buildTextField("البيان *", isLocked: true),
                DropdownField(
                  "",
                  lable: 'تصنيف الضريبة*',
                ),

                Expanded(
                    child: DateField(
                  " ",
                  label: 'تاريخ الاستحقاق *',
                )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.grid,
                    ),
                    child: buildExpansionTile("بيانات اخري")),
                SizedBox(
                  height: 20,
                ),

                // Additional Sections

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.grid,
                    ),
                    child: buildExpansionTile2("الأصناف")),
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
          padding: const EdgeInsets.only(left: 4),
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

Widget buildDropdownMenu(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
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

Widget buildExpansionTile2(String title) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Container(
            color: Colors.white,
            child: SizedBox(
              height: 136,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DropdownField(
                          '',
                          lable: 'اسم المنتج*',
                        ),
                        SizedBox(
                          height: 20,
                          width: 1000,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text('اجمالي الاصناف المضافة(0)'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          _buildExecuteButton(),
                          _buildExecuteButton2(),
                          SizedBox(width: 900),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
