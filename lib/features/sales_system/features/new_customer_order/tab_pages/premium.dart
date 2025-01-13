//الاقساط
import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/features/sales_system/cubit/cubit.dart';
import 'package:onyx/features/sales_system/cubit/state.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/premium_Table.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
        builder: (context, state) {
      // ignore: unused_local_variable
      var cubit = context.read<CustomerOrdersCubit>();
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Dropdown(
                      '',
                      lable: 'طريقة التوزيع*',
                    ),
                  ),
                  Expanded(child: _buildTextField('عدد الاقساط*')),
                  Expanded(child: _buildTextField('نسبة الدفعة المقدمة')),
                  Expanded(child: _buildTextField('مبلغ الدفعة المقدمة')),
                  _buildExecuteButton(),
                ],
              ),
              const SizedBox(height: 16),
              DataTableExample13(),
            ],
          ),
        ),
      );
    });
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

  Widget buildDropdoField(String label, List<String> items) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: DropdownButtonFormField2<String>(
                      decoration: InputDecoration(
                          labelText: label,
                          labelStyle: const TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          filled: true),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Container(
                                  height: 250,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 0.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: AppColors.griid,
                                      ),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontFamily: 'ReadexPro',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff474747),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        switch (value) {
                          case 'اخر كل شهر':
                            context
                                .read<CustomerOrdersCubit>()
                                .selectmonth(value!);
                            break;
                          case 'يومي':
                            context
                                .read<CustomerOrdersCubit>()
                                .selectday(value!);
                            break;
                          default:
                            break;
                        }
                      },
                    ),
                  ),
                  if (state.month)
                    Expanded(
                      child: Row(
                        children: [
                          _buildTextField('رقم البنك*'),
                          _buildTextField('تاريخ الشيك*'),
                          _buildTextField('رقم الشيك/الاشعار*'),
                          _buildTextField('مبلغ البنك*'),
                        ],
                      ),
                    ),
                  if (state.day)
                    Expanded(
                      child: Row(
                        children: [
                          _buildTextField('رقم البنك*'),
                          _buildTextField('رقم الشيك/الاشعار*'),
                          _buildTextField('مبلغ البنك*'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
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
            Icons.close,
            size: 24,
          ),
          label: const Text('أضافة'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
