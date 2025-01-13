//جدول الاقساط
import 'package:flutter/material.dart';

class DataTableExample13 extends StatelessWidget {
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
                      '264',
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
                    label: Text('رقم القسط',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('تاريخ القسط',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('رقم الشيك/الأشعار',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('تاريخ الشيك',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label:
                        Text('البيان', style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ القسط',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('نسبة الدفعة المقدمة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ الدفعة المقدمة',
                        style: TextStyle(color: Colors.white))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('1',
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('31/5/2024')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('البيان')),
                  DataCell(Text('660')),
                  DataCell(Text('10%')),
                  DataCell(Text('132')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1',
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('31/5/2024')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('البيان')),
                  DataCell(Text('660')),
                  DataCell(Text('10%')),
                  DataCell(Text('132')),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
