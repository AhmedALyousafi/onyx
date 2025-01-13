//بطاقة الائتمان
import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/credit_Card_Table.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
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
                  child: Dropdown('', lable: 'نوع الحركة البنكية *',),
                ),
                Expanded(child: _buildTextField('اسم البنك*')),
                Expanded(child: _buildTextField('اسم البطاقة*')),
                Expanded(child: Dropdown('', lable: 'المبلغ البنكي*',)),
                _buildExecuteButton(),
              ],
            ),
            const SizedBox(height: 16),
            DataTableExample12(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const UnderlineInputBorder(),
      ),
    );
  }

 
}

Widget _buildExecuteButton() {
  return const Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Icon(
              Icons.add_box,
              size: 40,
              color: Colors.green,
            ),
            Icon(
              Icons.restart_alt_outlined,
              size: 40,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    ],
  );
}
