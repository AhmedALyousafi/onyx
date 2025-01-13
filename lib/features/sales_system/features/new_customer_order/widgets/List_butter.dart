//التحكم بي العناصر التالية:الصفحة الرئيسية,بيانات اخرى,بيانات اضافية,الضريبة,وغيره

import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/features/sales_system/cubit/cubit.dart';
import 'package:onyx/features/sales_system/cubit/state.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/Sales_burdens_Table.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/add_field.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/additional_data.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/credit_card.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/download_document.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/main10.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/other_data.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/premium.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/taps_account.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/tax_Table.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DocumentForm1 extends StatefulWidget {
  const DocumentForm1({super.key});
  final bool isCollapsed = false;
  @override
  State<DocumentForm1> createState() => _TabsAndPagesState();
}

class _TabsAndPagesState extends State<DocumentForm1>
    with TickerProviderStateMixin {
  late TabController _tabDesktopController;

  void _initializeControllers(bool isCreditChecked) {
    int desktopTabs = isCreditChecked ? 8 : 7;

    _tabDesktopController = TabController(
        length: desktopTabs, vsync: this, initialIndex: desktopTabs - 1);
  }

  @override
  void dispose() {
    _tabDesktopController.dispose();
    super.dispose();
  }

  bool isHoverd = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
      builder: (context, state) {
        _initializeControllers(state.credit);
        final tabs = <Widget>[
          _buildTab('أضافة حقل'),
          if (!state.bank && !state.account) _buildTab('أعباء المبيعات'),
          _buildTab('الضريبة'),
          _buildTab('إنزال من'),
          if (state.account) _buildTab('الحسابات', isHighlighted: false),
          if (state.credit) _buildTab('الاقساط', isHighlighted: false),
          if (state.credit) _buildTab('بطائق الائتمان', isHighlighted: false),
          _buildTab('بيانات أضافية'),
          _buildTab('بيانات أخرى'),
          _buildTab('البيانات الرئيسية'),
        ];

        final views = <Widget>[
          Addfield(),
          if (!state.bank && !state.account) SalesburdensTable(),
          Tax_Table(),
          Downloaddocument(),
          if (state.account) Tapsaccount(),
          if (state.credit) Premium(),
          if (state.credit) CreditCard(),
          Additionaldata(),
          Otherdata(),
          Main10(),
        ];

        _tabDesktopController = TabController(
          length: tabs.length,
          vsync: this,
          initialIndex: tabs.length - 1,
        );

        return DefaultTabController(
          length: tabs.length,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      return WidgetsBinding.instance
                          .addPostFrameCallback((_) {});
                    },
                    icon: const Icon(
                      FontAwesomeIcons.solidRectangleList,
                      color: Color(0xFF00B4D8),
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11.0),
                          child: TabBar(
                            indicator: const BoxDecoration(
                              color: Color(0xFF094F90),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              border: Border(
                                top: BorderSide(
                                  color: AppColors.blue,
                                ),
                                right: BorderSide(
                                  color: AppColors.blue,
                                ),
                                left: BorderSide(
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                            controller: _tabDesktopController,
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            dividerColor: Colors.white,
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'ReadexPro',
                              fontWeight: FontWeight.w400,
                            ),
                            unselectedLabelColor: const Color(0xFF819AA7),
                            indicatorColor: Colors.orange,
                            tabs: tabs,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4)),
                  ],
                ),
                height: MediaQuery.of(context).size.height < 300
                    ? MediaQuery.of(context).size.height * 2
                    : MediaQuery.of(context).size.height * 3,
                child: TabBarView(
                  controller: _tabDesktopController,
                  children: views,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to build a tab with border and hover effect
  // Method to build a tab with border and hover effect
  Widget _buildTab(String text, {bool isHighlighted = false}) {
    return Container(
      height: 31,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: isHighlighted
            ? Colors.white
            : Colors.transparent, // Change background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        border: const Border(
          top: BorderSide(
            color: Color(0xFFE2E2E2),
          ),
          right: BorderSide(
            color: Color(0xFFE2E2E2),
          ),
          left: BorderSide(
            color: Color(0xFFE2E2E2),
          ),
        ),
      ),
      child: Tab(
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'ReadexPro',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(String label, {bool isLocked = false}) {
  return Expanded(
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: isLocked ? Icon(Icons.lock) : null,
            // border: OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );
}

Widget buildDropdownField(String label) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
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
    ),
  );
}
