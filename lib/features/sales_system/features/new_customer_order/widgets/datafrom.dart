import 'package:onyx/core/responsive/adaptivelayout.dart';
import 'package:onyx/core/responsive/widgetbutton.dart';
import 'package:onyx/features/sales_system/cubit/cubit.dart';
import 'package:onyx/features/sales_system/cubit/state.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/dataformdropdown.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/mobildropdown.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/textfildmethod.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/tixtfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/app_colors.dart';

class CheckBoxItem extends StatelessWidget {
  static final Map<String, TextEditingController> controllers = {
    'رقم الصندوق': TextEditingController(),
    'حساب': TextEditingController(),
    'آجل': TextEditingController(),
    'بنكي': TextEditingController(),
    'نقدي': TextEditingController(),
  };

  const CheckBoxItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
      builder: (context, state) {
        final cubit = context.read<CustomerOrdersCubit>();

        return AdaptiveLayout(
          mobileLayout: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD2ECFC)),
              color: const Color(0xFFEBF8FF),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildCheckbox(context, 'بنكي', state.bank, (value) {
                      cubit.selectbank(value!);
                    }),
                    _buildCheckbox(context, 'نقدي', state.cash, (value) {
                      cubit.selectcash(value!);
                    }),
                  ],
                ),
                Row(
                  children: [
                    _buildCheckbox(context, 'من حساب', state.account, (value) {
                      cubit.selectaccount(value!);
                    }),
                    _buildCheckbox(context, 'آجل', state.credit, (value) {
                      cubit.selectcredit(value!);
                    }),
                  ],
                ),
                _buildFormRow([
                  TextFieldWidget(
                    lable: 'المبلغ البنكي',
                    enabled: state.bank,
                    preffixText: '0.00',
                  ),
                  TextFieldWidget(
                    lable: 'المبلغ النقدي',
                    enabled: state.cash,
                    preffixText: '0.00',
                  ),
                ]),
                const SizedBox(
                  height: 10.0,
                ),
                _buildFormRow([
                  TextFieldWidget(
                    lable: 'مبلغ الحساب',
                    enabled: state.account,
                    preffixText: '0.00',
                  ),
                  TextFieldWidget(
                    lable: 'المبلغ الآجل',
                    enabled: state.credit,
                    preffixText: '0.00',
                  ),
                ]),
                if (state.account)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Divider(
                        color: Color(0xFFE2E2E2),
                        indent: 5,
                        endIndent: 5,
                      ),
                      const DropDownButtonWidget(items: [
                        'تابي',
                      ], label: 'الجهة*'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      DropDownButtonWidget(
                        items: const [
                          'حساب 1 (إضافة مبلغ الحساب)',
                          "حساب 2 (إضافة حساب تحليلي)",
                        ],
                        label: 'الحساب الرئيسي*',
                        isEnabled: state.trans ? true : false,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: DropDownButtonWidget(items: [
                          'حساب 1(إضافة حساب فرعي)',
                        ], label: 'الحساب التحليلي*'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: DropDownButtonWidget(items: [
                          'الحساب الفرعي',
                        ], label: 'الحساب الفرعي*'),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0, left: 5.0),
                        child: MobileTextFieldWidget(
                            lable: 'مبلغ الحساب', enabled: true),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.add_box,
                          color: state.account
                              ? const Color(0xFF319626)
                              : const Color(0xFF819AA7),
                          size: 40,
                        ),
                      ),
                      Column(
                        children: [
                          MobileTextFieldWidget(
                              lable: 'مبلغ الحساب', enabled: true),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, bottom: 0.0),
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xFF474747),
                                  ),
                                  height: 30,
                                  width: 30,
                                  child: const Icon(FontAwesomeIcons.rotate,
                                      color: Colors.white, size: 18),
                                ),
                                const Icon(
                                  Icons.add_box,
                                  color: Color(0xFF319626),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                if (state.bank)
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          cubit.selectBankvisible(!state.isBankFieldVisible);
                        },
                        child: Row(
                          children: [
                            Text(
                              state.isBankFieldVisible ? 'إخفاء' : 'إظهار',
                              style: const TextStyle(
                                color: Color(0xFF474747),
                                fontSize: 12,
                                fontFamily: 'ReadexPro',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Icon(
                              state.isBankFieldVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: const Color(0xFF817AA7),
                            ),
                          ],
                        ),
                      ),
                      if (state.isBankFieldVisible)
                        const Divider(
                          color: AppColors.blue,
                          thickness: 4,
                          endIndent: 50,
                          indent: 50,
                        ),
                    ],
                  ),
                const SizedBox(
                  height: 5.0,
                ),
                if (state.isBankFieldVisible)
                  const BankAmountDropdownButton(
                    items: [
                      'شيك',
                      'تحويل',
                      'بطاقة الائتمان',
                    ],
                    label: 'نوع الحركة البنكية',
                  ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          tabletLayout: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD2ECFC)),
              color: const Color(0xFFEBF8FF),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildCheckbox(context, 'من حساب', state.account, (value) {
                      cubit.selectaccount(value!);
                    }),
                    _buildCheckbox(context, 'آجل', state.credit, (value) {
                      cubit.selectcredit(value!);
                    }),
                    _buildCheckbox(context, 'بنكي', state.bank, (value) {
                      cubit.selectbank(value!);
                    }),
                    _buildCheckbox(context, 'نقدي', state.cash, (value) {
                      cubit.selectcash(value!);
                    }),
                  ],
                ),
                _buildFormRow([
                  TextFieldPaymentmethodWidget(
                    lable: 'مبلغ الحساب',
                    enabled: state.account,
                    preffixText: '0.00',
                  ),
                  TextFieldPaymentmethodWidget(
                    lable: 'المبلغ الآجل',
                    enabled: state.credit,
                    preffixText: '0.00',
                  ),
                  TextFieldPaymentmethodWidget(
                    lable: 'المبلغ البنكي',
                    enabled: state.bank,
                    preffixText: '0.00',
                  ),
                  TextFieldPaymentmethodWidget(
                    lable: 'المبلغ النقدي',
                    enabled: state.cash,
                    preffixText: '0.00',
                  ),
                ]),
                if (state.account)
                  Column(
                    children: [
                      const Divider(
                        color: Color(0xFFE2E2E2),
                        indent: 5,
                        endIndent: 5,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20.0,
                          ),
                          Icon(
                            Icons.add_box,
                            color: state.account
                                ? const Color(0xFF319626)
                                : const Color(0xFF819AA7),
                            size: 50,
                          ),
                          TextFieldWidget(lable: 'مبلغ الحساب', enabled: true),
                          Expanded(
                              child: DropDownButtonWidget(items: [
                            'حساب 1(إضافة حساب فرعي)',
                          ], label: 'الحساب التحليلي*')),
                          const Expanded(
                              child: DropDownButtonWidget(items: [
                            'الحساب الفرعي',
                          ], label: 'الحساب الفرعي*')),
                          Expanded(
                            child: DropDownButtonWidget(
                              items: const [
                                'حساب 1 (إضافة مبلغ الحساب)',
                                "حساب 2 (إضافة حساب تحليلي)",
                              ],
                              label: 'الحساب الرئيسي*',
                              isEnabled: state.trans ? true : false,
                            ),
                          ),
                          const Expanded(
                            child: DropDownButtonWidget(items: [
                              'تابي',
                            ], label: 'الجهة*'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, bottom: 0.0),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xFF474747),
                            ),
                            height: 30,
                            width: 30,
                            child: const Icon(FontAwesomeIcons.rotate,
                                color: Colors.white, size: 18),
                          ),
                          const Icon(
                            Icons.add_box,
                            color: Color(0xFF319626),
                            size: 40,
                          ),
                          const SizedBox(
                            width: 235,
                            child: MobileTextFieldWidget(
                                lable: 'مبلغ الحساب', enabled: true),
                          ),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                if (state.bank)
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          cubit.selectBankvisible(!state.isBankFieldVisible);
                        },
                        child: Row(
                          children: [
                            Text(
                              state.isBankFieldVisible ? 'إخفاء' : 'إظهار',
                              style: const TextStyle(
                                color: Color(0xFF474747),
                                fontSize: 12,
                                fontFamily: 'ReadexPro',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Icon(
                              state.isBankFieldVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: const Color(0xFF817AA7),
                            ),
                          ],
                        ),
                      ),
                      if (state.isBankFieldVisible)
                        const Divider(
                          color: AppColors.blue,
                          thickness: 4,
                          endIndent: 50,
                          indent: 50,
                        ),
                    ],
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                if (state.isBankFieldVisible)
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: BankAmountDropdownButton(
                        items: [
                          'شيك',
                          'تحويل',
                          'بطاقة الائتمان',
                        ],
                        label: 'نوع الحركة البنكية',
                      ),
                    ),
                  ),
              ],
            ),
          ),
          desktopLayout: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD2ECFC)),
              color: const Color(0xFFEBF8FF),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildCheckbox(context, 'من حساب', state.account, (value) {
                      cubit.selectaccount(value!);
                    }),
                    _buildCheckbox(context, 'آجل', state.credit, (value) {
                      cubit.selectcredit(value!);
                    }),
                    _buildCheckbox(
                      context,
                      'بنكي',
                      state.bank,
                      (value) {
                        cubit.selectbank(value!);
                      },
                    ),
                    _buildCheckbox(context, 'نقدي', state.cash, (value) {
                      cubit.selectcash(value!);
                    }),
                  ],
                ),
                _buildFormRow([
                  TextFieldPaymentmethodWidget(
                    lable: 'مبلغ الحساب',
                    enabled: state.account,
                    preffixText: '0.00',
                  ),
                  TextFieldPaymentmethodWidget(
                    lable: 'المبلغ الآجل',
                    enabled: state.credit,
                    preffixText: '0.00',
                  ),
                  TextFieldPaymentmethodWidget(
                    lable: 'المبلغ البنكي',
                    enabled: state.bank,
                    preffixText: '0.00',
                  ),
                  TextFieldPaymentmethodWidget(
                    lable: 'المبلغ النقدي',
                    enabled: state.cash,
                    preffixText: '0.00',
                  ),
                ]),
                if (state.account)
                  Column(
                    children: [
                      const Divider(
                        color: Color(0xFFE2E2E2),
                        indent: 5,
                        endIndent: 5,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20.0,
                          ),
                          const TextFieldWidget(
                              lable: 'مبلغ الحساب', enabled: true),
                          const Expanded(
                              child: DropDownButtonWidget(items: [
                            'حساب 1(إضافة حساب فرعي)',
                          ], label: 'الحساب التحليلي*')),
                          const Expanded(
                              child: DropDownButtonWidget(items: [
                            'الحساب الفرعي',
                          ], label: 'الحساب الفرعي*')),
                          Expanded(
                            child: DropDownButtonWidget(
                              items: const [
                                'حساب 1 (إضافة مبلغ الحساب)',
                                "حساب 2 (إضافة حساب تحليلي)",
                              ],
                              label: 'الحساب الرئيسي*',
                              isEnabled: state.trans ? true : false,
                            ),
                          ),
                          const Expanded(
                            child: DropDownButtonWidget(items: [
                              'تابي',
                            ], label: 'الجهة*'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, bottom: 0.0),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xFF474747),
                            ),
                            height: 30,
                            width: 30,
                            child: const Icon(FontAwesomeIcons.rotate,
                                color: Colors.white, size: 18),
                          ),
                          const Icon(
                            Icons.add_box,
                            color: Color(0xFF319626),
                            size: 40,
                          ),
                          SizedBox(
                            width: 300,
                            child: MobileTextFieldWidget(lable: 'مبلغ الحساب'),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  height: 10.0,
                ),
                if (state.bank)
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          cubit.selectBankvisible(!state.isBankFieldVisible);
                        },
                        child: Row(
                          children: [
                            Text(
                              state.isBankFieldVisible ? 'إخفاء' : 'إظهار',
                              style: const TextStyle(
                                color: Color(0xFF474747),
                                fontSize: 12,
                                fontFamily: 'ReadexPro',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Icon(
                              state.isBankFieldVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: const Color(0xFF817AA7),
                            ),
                          ],
                        ),
                      ),
                      if (state.isBankFieldVisible)
                        const Divider(
                          color: AppColors.blue,
                          thickness: 4,
                          endIndent: 50,
                          indent: 50,
                        ),
                    ],
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                _buildFormRow([
                  if (state.isBankFieldVisible)
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: BankAmountDropdownButton(
                          items: [
                            'شيك',
                            'تحويل',
                            'بطاقة الائتمان',
                          ],
                          label: 'نوع الحركة البنكية',
                        ),
                      ),
                    ),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckbox(BuildContext context, String label, bool isChecked,
      Function(bool?) onChanged) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'ReadexPro',
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              checkboxTheme: CheckboxThemeData(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
                side: const BorderSide(
                  color: Color(0xFFE2E2E2),
                  width: 0.5,
                ),
              ),
            ),
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: const Color(0xFF094F90),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color(0xFF094F90);
                  }
                  return Colors.white;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormRow(List<Widget> children) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

Widget _buildTextField(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
      ),
    ),
  );
}
