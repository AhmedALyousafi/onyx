import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class Addfield extends StatelessWidget {
  const Addfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AdaptiveLayout(
          desktopLayout: const Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 1',
                  )),
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 2',
                  )),
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 3',
                  )),
                  const Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 4',
                  )),
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 5',
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 6',
                  )),
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 7',
                  )),
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 8',
                  )),
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 9',
                  )),
                  Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 10',
                  )),
                ],
              ),
            ],
          ),
          tabletLayout: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('حقل اضافي 1'),
                  ),
                  const Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 2',
                  )),
                  const Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 3',
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('حقل اضافي 4'),
                  ),
                  const Expanded(
                      child: Dropdown(
                    '',
                    lable: 'حقل اضافي 5',
                  )),
                  Expanded(child: _buildTextField('حقل اضافي 6')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildTextField('حقل اضافي 7')),
                  Expanded(child: _buildTextField('حقل اضافي 8')),
                  Expanded(child: _buildTextField('حقل اضافي 9')),
                  Expanded(child: _buildTextField('حقل اضافي 10')),
                ],
              ),
            ],
          ),
          mobileLayout: const Column(
            children: [
              const Dropdown('', lable: 'حقل اضافي 1'),
              Dropdown('', lable: 'حقل اضافي 2'),
              Dropdown('', lable: 'حقل اضافي 3'),
              Dropdown('', lable: 'حقل اضافي 4'),
              Dropdown('', lable: 'حقل اضافي 5'),
              Dropdown('', lable: 'حقل اضافي 6'),
              Dropdown('', lable: 'حقل اضافي 7'),
              Dropdown('', lable: 'حقل اضافي 8'),
              Dropdown('', lable: 'حقل اضافي 9'),
              Dropdown('', lable: 'حقل اضافي 10'),
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
