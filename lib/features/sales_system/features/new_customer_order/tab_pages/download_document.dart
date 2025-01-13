//انزال من
import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/core/theme/app_colors.dart';

class Downloaddocument extends StatelessWidget {
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
                  child: Dropdown(
                    '',
                    lable: 'نوع انزال الوثيقة',
                  ),
                ),
                Expanded(
                    child: Dropdown(
                  '',
                  lable: 'انزال من',
                )),
                Expanded(
                    child: Dropdown(
                  '',
                  lable: 'رقم الوثيقة المرجعية',
                )),
                Expanded(child: _buildTextField('تاريخ الوثيقه المرجعية')),
                Expanded(child: _buildTextField('رقم العقد*')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildExecuteButton()),
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
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.griid)),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: const UnderlineInputBorder(),
        ),
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
          icon: const Icon(
            Icons.sim_card_download,
            size: 24,
          ),
          label: const Text('تنفيذ'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
