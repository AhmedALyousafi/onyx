//جدول بطاقة الائتمان
import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/home/dropdown_field.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/utils/date_field.dart';

class DataTableExample12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildFirstDataTable(),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: const Padding(
              padding: EdgeInsets.only(
                  right: 30.0, left: 80, top: 10.0, bottom: 10.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Text(
                      '100.000',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'الاجمالي',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 40,
            color: Colors.grey,
            indent: 14,
            endIndent: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.grid,
            ),
            child: buildExpansionTile("بيانات إضافية "),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.grid,
            ),
            child: buildExpansionTile2("الأصناف"),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildFirstDataTable() {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 100,
            width: 1500,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 1, 100, 181)),
              columns: const [
                DataColumn(
                    label: Text('نوع البطاقة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ البنك',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('نسبة العمولة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ العمولة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('تاريخ الأستحقاق',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('الضريبة(%)',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ الضريبة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('رقم المرجع',
                        style: TextStyle(color: Colors.white))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('مدي',
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('100.000')),
                  DataCell(Text('10%')),
                  DataCell(Text('10.000')),
                  DataCell(Text('15/6/2024')),
                  DataCell(Text('5')),
                  DataCell(Text('5.000')),
                  DataCell(Text('123')),
                ]),
              ],
            ),
          ),
        ),
      ],
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
                  buildTextField('رقم الجوال'),
                  buildTextField('عنوان العميل'),
                  DateField('', label: 'تاريخ انتهاء الطلب',),
                  buildTextField('رقم المرجع'),
                  buildTextField('عدد المرفقات'),
                  const SizedBox(
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
                height: 100,
                child: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DropdownField('', lable: 'اسم المنتج*',),
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

 

 
}
