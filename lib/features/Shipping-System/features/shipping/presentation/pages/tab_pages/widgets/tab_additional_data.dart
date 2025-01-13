//بيانات اضافية
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/utils/responsive.dart';

class Additionaldata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AdaptiveLayout(
        desktopLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown('نص رقم مخزن'),
                    ),
                    Expanded(child: _buildDropdown('رقم المشروع')),
                    Expanded(child: _buildDropdown('دليل فرعي3')),
                    Expanded(child: _buildDropdown('دليل فرعي4')),
                    Expanded(child: _buildDropdown('دليل فرعي5')),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 1444, child: _buildDropdown('دليل فرعي6')),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        tabletLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown('نص رقم مخزن'),
                    ),
                    Expanded(child: _buildDropdown('رقم المشروع')),
                    Expanded(child: _buildDropdown('دليل فرعي3')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildDropdown('دليل فرعي4')),
                    Expanded(child: _buildDropdown('دليل فرعي5')),
                    Expanded(child: _buildDropdown('دليل فرعي6')),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        mobileLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildDropdown('نص رقم مخزن'),
                _buildDropdown('رقم المشروع'),
                _buildDropdown('دليل فرعي3'),
                _buildDropdown('دليل فرعي4'),
                _buildDropdown('دليل فرعي5'),
                _buildDropdown('دليل فرعي6')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField2<String>(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.griid)),
              contentPadding: EdgeInsets.all(0)),
          iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.zero),
          hint: Text(
            label,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          items: [
            DropdownMenuItem(
              child: Text("Option 1"),
              value: "1",
            ),
            DropdownMenuItem(
              child: Text("Option 2"),
              value: "2",
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
