//جدول أعباء المبيعات
import 'package:flutter/material.dart';

class SalesburdensTable extends StatelessWidget {
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
              child: Row(
                children: [
                  Text(
                    '2460',
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
            height: 200,
            width: 1500,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 1, 100, 181)),
              columns: const [
                DataColumn(
                    label: Text('رقم العبء',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('اسم العبء',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('رقم الحساب',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('الحساب التحليلي',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('لحساب التحليلي الفرعي',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('اسم الحساب',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label:
                        Text('النسبة', style: TextStyle(color: Colors.white))),
                DataColumn(
                    label:
                        Text('المبلغ', style: TextStyle(color: Colors.white))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('1',
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('اسم العبء')),
                  DataCell(Text('14141')),
                  DataCell(Text('الحساب التحليلي')),
                  DataCell(Text('الحساب التحليلي الفرعي')),
                  DataCell(Text('1')),
                  DataCell(Text('14.00')),
                  DataCell(Text('500.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1',
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('اسم العبء')),
                  DataCell(Text('14141')),
                  DataCell(Text('الحساب التحليلي')),
                  DataCell(Text('الحساب التحليلي الفرعي')),
                  DataCell(Text('1')),
                  DataCell(Text('14.00')),
                  DataCell(Text('200.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1',
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('اسم العبء')),
                  DataCell(Text('14141')),
                  DataCell(Text('الحساب التحليلي')),
                  DataCell(Text('الحساب التحليلي الفرعي')),
                  DataCell(Text('1')),
                  DataCell(Text('14.00')),
                  DataCell(Text('100.00')),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondDataTable() {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 1, 100, 181)),
            columns: const [
              DataColumn(
                  label:
                      Text('رقم الصنف', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label:
                      Text('اسم الصنف', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label:
                      Text('نوع العبء', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text('المبلغ', style: TextStyle(color: Colors.white))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('1',
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 100, 181)))),
                DataCell(Text('اسم العيب')),
                DataCell(Text('14141')),
                DataCell(Text('500.00')),
              ]),
              DataRow(cells: [
                DataCell(Text('1',
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 100, 181)))),
                DataCell(Text('اسم العيب')),
                DataCell(Text('14141')),
                DataCell(Text('200.00')),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
