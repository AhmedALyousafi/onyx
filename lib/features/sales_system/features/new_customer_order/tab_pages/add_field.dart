//اضافة حقل

import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/adaptivelayout.dart';
import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/core/theme/app_colors.dart';

class Addfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AdaptiveLayout(
          desktopLayout: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('حقل اضافي 1'),
                  ),
                  Expanded(child: Dropdown('', lable: 'حقل اضافي 2',)),
                  Expanded(child: Dropdown('', lable: 'حقل اضافي 3',)),
                  Expanded(child: Dropdown('', lable: 'حقل اضافي 4',)),
                  Expanded(child: _buildTextField('حقل اضافي 5')),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildTextField('حقل اضافي 6')),
                  Expanded(child: _buildTextField('حقل اضافي 7')),
                  Expanded(child: _buildTextField('حقل اضافي 8')),
                  Expanded(child: _buildTextField('حقل اضافي 9')),
                  Expanded(child: _buildTextField('حقل اضافي 10')),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
          tabletLayout: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('حقل اضافي 1'),
                  ),
                  Expanded(child: Dropdown('', lable: 'حقل اضافي 2',)),
                  Expanded(child: Dropdown('', lable: 'حقل اضافي 3',)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('حقل اضافي 4'),
                  ),
                  Expanded(child: Dropdown('', lable: 'حقل اضافي 5',)),
                  Expanded(child: _buildTextField('حقل اضافي 6')),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildTextField('حقل اضافي 7')),
                  Expanded(child: _buildTextField('حقل اضافي 8')),
                  Expanded(child: _buildTextField('حقل اضافي 9')),
                  Expanded(child: _buildTextField('حقل اضافي 10')),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
          mobileLayout: Column(
            children: [
              Expanded(
                child: _buildTextField('حقل اضافي 1'),
              ),
              Expanded(child: Dropdown('', lable: 'حقل اضافي 2',)),
              Expanded(child: _buildTextField('حقل اضافي 3')),
              Expanded(child: _buildTextField('حقل اضافي 4')),
              Expanded(child: _buildTextField('حقل اضافي 5')),
              Expanded(child: _buildTextField('حقل اضافي 6')),
              Expanded(child: _buildTextField('حقل اضافي 7')),
              Expanded(child: _buildTextField('حقل اضافي 8')),
              Expanded(child: _buildTextField('حقل اضافي 9')),
              Expanded(child: _buildTextField('حقل اضافي 10')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.griid)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }

 
}
