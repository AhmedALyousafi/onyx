import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/utils/date_field.dart';
import 'package:onyx/core/utils/responsive_utils.dart';

class TapInsurance extends StatelessWidget {
  const TapInsurance({super.key});

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
                    const Expanded(
                      child: DateField(
                        '',
                        label: 'التاريخ',
                      ),
                    ),
                    const Expanded(
                        child: Dropdown(
                      '',
                      lable: 'نوع التأمين',
                    )),
                    const Expanded(
                        child: Dropdown(
                      '',
                      lable: 'شركة التامين',
                    )),
                    const Expanded(
                        child: Dropdown(
                      '',
                      lable: 'العملة',
                    )),
                    Expanded(child: buildTextField('سعر التحويل')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: buildTextField('اخر موعد للشحن')),
                    Expanded(child: buildTextField('مبلغ التأمين')),
                    Expanded(child: buildTextField('مبلغ قسط التأمين')),
                    Expanded(
                        child: buildTextField('شروط التأمين Text Area Field')),
                  ],
                ),
              ],
            ),
          ),
        ),
        tabletLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: DateField(
                        '',
                        label: 'التاريخ',
                      ),
                    ),
                    Expanded(
                        child: Dropdown(
                      '',
                      lable: 'نوع التأمين',
                    )),
                    Expanded(
                        child: Dropdown(
                      '',
                      lable: 'شركة التامين',
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: buildTextField('اخر موعد للشحن')),
                    const Expanded(
                        child: Dropdown(
                      '',
                      lable: 'العملة',
                    )),
                    Expanded(child: buildTextField('سعر التحويل')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: buildTextField('مبلغ قسط التأمين')),
                    Expanded(
                        child: buildTextField('شروط التأمين Text Area Field')),
                  ],
                ),
              ],
            ),
          ),
        ),
        mobileLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(child: buildTextField('سعر التحويل')),
                const Expanded(
                    child: Dropdown(
                  '',
                  lable: 'العملة',
                )),
                const Expanded(
                    child: Dropdown(
                  '',
                  lable: 'شركة التامين',
                )),
                const Expanded(
                    child: Dropdown(
                  '',
                  lable: 'نوع التامين',
                )),
                const Expanded(
                    child: const DateField(
                  '',
                  label: 'التاريخ',
                )),
                Expanded(child: buildTextField('شروط التأمين Text Area Field')),
                Expanded(child: buildTextField('مبلغ قسط التأمين')),
                Expanded(child: buildTextField('مبلغ التأمين')),
                Expanded(child: buildTextField('اخر موعد للشحن'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, {bool isLocked = false}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.griid)),
                labelText: label,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff819AA7),
                )),
          )),
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
