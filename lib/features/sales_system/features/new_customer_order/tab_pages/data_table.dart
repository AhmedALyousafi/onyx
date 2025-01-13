//جدول الاقساط
import 'package:flutter/material.dart';

class DataTableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildFirstDataTable(),
          SizedBox(height: 16),
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
                      '100,000',
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
            height: 150,
            width: 1500,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 1, 100, 181)),
              columns: const [
                DataColumn(
                    label:
                        Text('الجهة', style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('رقم الحساب',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('الحساب التحليلي',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('اسم الحساب',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ الحساب',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('رقم المشروع',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('رقم بنود مشاريع',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label:
                        Text('البيان', style: TextStyle(color: Colors.white))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('تابي',
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('1110107')),
                  DataCell(Text('الحساب التحليلي')),
                  DataCell(Text('اسم الحساب')),
                  DataCell(Text('100,000')),
                  DataCell(Text('1110107')),
                  DataCell(Text('1110107')),
                  DataCell(Text('')),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
