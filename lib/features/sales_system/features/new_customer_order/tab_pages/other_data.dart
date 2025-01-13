//بيانات اخرى
import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/core/theme/app_colors.dart';

class Otherdata extends StatelessWidget {
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
                  child: _buildTextField('رقم المندوب'),
                ),
                Expanded(child: Dropdown('', lable: 'رقم الممسوق',)),
                Expanded(child: _buildTextField('رقم السيارة')),
                Expanded(child: Dropdown('', lable: 'رقم السائق',)),
               
                Expanded(child: _buildTextField('رقم المستفيد *')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTextField('الحساب في البنك *')),
                Expanded(child: _buildTextField('إجمالي التأمين')),
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
