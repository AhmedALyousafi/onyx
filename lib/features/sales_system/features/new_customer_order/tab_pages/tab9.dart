import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/home/dropdown.dart';

class FormPage9 extends StatelessWidget {
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
                const Expanded(
                  child: Dropdown('', lable: 'رقم مركز التكلفة',),
                ),
                const Expanded(child: Dropdown('', lable: 'نص رقم مخازن',)),
                const Expanded(child: Dropdown('', lable: 'نص رقم مراكز',)),
                Expanded(child: _buildTextField('نص رقم الدليل الفرعي')),
                Expanded(child: _buildTextField('رقم المستفيد')),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }

 
}
