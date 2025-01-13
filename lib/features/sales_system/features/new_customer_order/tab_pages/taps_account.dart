import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/data_table.dart';
import 'package:flutter/material.dart';

class Tapsaccount extends StatelessWidget {
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
                  child: Dropdown('', lable: 'الجهة',),
                ),
                Expanded(child: Dropdown('', lable: 'الحساب رئيسي*',)),
                Expanded(child: _buildTextField('مبلغ الحساب*')),
                Icon(
                  Icons.add_box,
                  size: 50,
                  color: Colors.black54,
                ),
                SizedBox(width: 500),
              ],
            ),
            DataTableExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(),
      ),
    );
  }

 
}

Widget _buildExecuteButton() {
  return Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.add_box,
            size: 40,
            color: Colors.green,
          ),
          label: Text('تنفيذ'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
