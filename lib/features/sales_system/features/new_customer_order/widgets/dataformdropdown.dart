import 'package:onyx/core/responsive/adaptivelayout.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/features/sales_system/cubit/cubit.dart';
import 'package:onyx/features/sales_system/cubit/state.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/mobildropdown.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/paymentTextfiled.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BankAmountDropdownButton extends StatefulWidget {
  const BankAmountDropdownButton({
    super.key,
    required this.items,
    required this.label,
  });

  final List<String> items;
  final String label;

  @override
  State<BankAmountDropdownButton> createState() =>
      _BankAmountDropdownButtonState();
}

class _BankAmountDropdownButtonState extends State<BankAmountDropdownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AdaptiveLayout(
            desktopLayout: SizedBox(
              height: 70.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 25.0),
                    child: SizedBox(
                      width: 225,
                      child: DropdownButtonFormField2<String>(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                        hint: Text(
                          widget.label,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        items: widget.items
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
                                          color: Color(0xFF474747),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an item.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          switch (value) {
                            case 'شيك':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selectcheek(value!);
                              break;
                            case 'تحويل':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selecttrans(value!);
                              break;
                            case 'بطاقة الائتمان':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selectcreditCard(value!);
                              break;
                            default:
                              break;
                          }
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return widget.items
                              .map((item) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontFamily: 'ReadexPro',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF474747),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList();
                        },
                      ),
                    ),
                  ),
                  if (state.credit)
                    Expanded(
                      child: Row(
                        children: [
                          const PaymentMethodTextField(lable: 'اسم البنك*'),
                          const PaymentMethodTextField(lable: 'اسم البطاقة*'),
                          const PaymentMethodTextField(lable: 'المبلغ البنكي*'),
                          Container(
                            margin: const EdgeInsets.only(bottom: 25.0),
                            child: const Icon(
                              FontAwesomeIcons.solidSquarePlus,
                              color: Color(0xFF319626),
                              size: 40,
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, bottom: 25.0),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF474747),
                            ),
                            height: 35,
                            width: 35,
                            child: const Icon(FontAwesomeIcons.rotate,
                                color: Colors.white, size: 18),
                          ),
                        ],
                      ),
                    ),
                  if (state.trans)
                    const Expanded(
                      child: Row(
                        children: [
                          PaymentMethodTextField(lable: 'رقم البنك*'),
                          PaymentMethodTextField(lable: 'تاريخ الشيك*'),
                          PaymentMethodTextField(lable: 'رقم الشيك/الاشعار*'),
                        ],
                      ),
                    ),
                  if (state.cheek)
                    const Expanded(
                      child: Row(
                        children: [
                          PaymentMethodTextField(lable: 'رقم البنك*'),
                          PaymentMethodTextField(lable: 'تاريخ الشيك*'),
                          PaymentMethodTextField(lable: 'رقم الشيك/الاشعار*'),
                          PaymentMethodTextField(lable: 'مبلغ البنك*'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            tabletLayout: SizedBox(
              height: 70.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 25.0),
                    child: SizedBox(
                      width: 225,
                      child: DropdownButtonFormField2<String>(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            )),
                        hint: Text(
                          widget.label,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        items: widget.items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    height: 250,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: const BoxDecoration(
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
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an item.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          switch (value) {
                            case 'شيك':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selectcheek(value!);
                              break;
                            case 'تحويل':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selecttrans(value!);
                              break;
                            case 'بطاقة الائتمان':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selectcreditCard(value!);
                              break;
                            default:
                              break;
                          }
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          height: 40.0,
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return widget.items
                              .map((item) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontFamily: 'ReadexPro',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF474747),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList();
                        },
                      ),
                    ),
                  ),
                  if (state.credit)
                    Expanded(
                      child: Row(
                        children: [
                          const PaymentMethodTextField(lable: 'اسم البنك*'),
                          const PaymentMethodTextField(lable: 'اسم البطاقة*'),
                          const PaymentMethodTextField(lable: 'المبلغ البنكي*'),
                          Container(
                            margin: const EdgeInsets.only(bottom: 25.0),
                            child: const Icon(
                              FontAwesomeIcons.solidSquarePlus,
                              color: Color(0xFF319626),
                              size: 40,
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, bottom: 25.0),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF474747),
                            ),
                            height: 35,
                            width: 35,
                            child: const Icon(FontAwesomeIcons.rotate,
                                color: Colors.white, size: 18),
                          ),
                        ],
                      ),
                    ),
                  if (state.trans)
                    const Expanded(
                      child: Row(
                        children: [
                          PaymentMethodTextField(lable: 'رقم البنك*'),
                          PaymentMethodTextField(lable: 'تاريخ الشيك*'),
                          PaymentMethodTextField(lable: 'رقم الشيك/الاشعار*'),
                        ],
                      ),
                    ),
                  if (state.cheek)
                    const Expanded(
                      child: Row(
                        children: [
                          PaymentMethodTextField(lable: 'رقم البنك*'),
                          PaymentMethodTextField(lable: 'تاريخ الشيك*'),
                          PaymentMethodTextField(lable: 'رقم الشيك/الاشعار*'),
                          PaymentMethodTextField(lable: 'مبلغ البنك*'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            mobileLayout: SizedBox(
              height: 300.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 25.0),
                    child: SizedBox(
                      // width: 300,
                      child: DropdownButtonFormField2<String>(
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            )),
                        hint: Text(
                          widget.label,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        items: widget.items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    height: 250,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    decoration: const BoxDecoration(
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
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an item.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          switch (value) {
                            case 'شيك':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selectcheek(value!);
                              break;
                            case 'تحويل':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selecttrans(value!);
                              break;
                            case 'بطاقة الائتمان':
                              context
                                  .read<CustomerOrdersCubit>()
                                  .selectcreditCard(value!);

                              break;
                            default:
                              break;
                          }
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          height: 40.0,
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return widget.items
                              .map((item) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontFamily: 'ReadexPro',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF474747),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList();
                        },
                      ),
                    ),
                  ),
                  if (state.credit)
                    Column(
                      children: [
                        const MobileTextFieldWidget(
                          lable: 'اسم البنك*',
                          enabled: true,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const MobileTextFieldWidget(
                          lable: 'اسم البطاقة*',
                          enabled: true,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const MobileTextFieldWidget(
                          lable: 'المبلغ البنكي*',
                          enabled: true,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 0.0),
                                child: const Icon(
                                  FontAwesomeIcons.solidSquarePlus,
                                  color: Color(0xFF319626),
                                  size: 40,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, bottom: 0.0),
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFF474747),
                                ),
                                height: 35,
                                width: 35,
                                child: const Icon(FontAwesomeIcons.rotate,
                                    color: Colors.white, size: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (state.trans)
                    const Expanded(
                      child: Column(
                        children: [
                          MobileTextFieldWidget(
                            lable: 'رقم البنك*',
                            enabled: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MobileTextFieldWidget(
                            lable: 'تاريخ الشيك*',
                            enabled: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MobileTextFieldWidget(
                            lable: 'رقم الشيك/الاشعار*',
                            enabled: true,
                          ),
                        ],
                      ),
                    ),
                  if (state.cheek)
                    const Expanded(
                      child: Column(
                        children: [
                          MobileTextFieldWidget(
                            lable: 'رقم البنك*',
                            enabled: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MobileTextFieldWidget(
                            lable: 'تاريخ الشيك*',
                            enabled: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MobileTextFieldWidget(
                            lable: 'رقم الشيك/الاشعار*',
                            enabled: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MobileTextFieldWidget(
                            lable: 'مبلغ البنك*',
                            enabled: true,
                          ),
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
