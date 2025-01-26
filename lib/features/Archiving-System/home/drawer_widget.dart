import 'package:flutter/material.dart';
import 'package:onyx/core/appbar/appbar.dart';
import 'package:onyx/core/appbar/header_widget.dart';
import 'package:onyx/core/utils/responsive.dart';
import 'package:onyx/features/Archiving-System/home/archiving_breadcrumb.dart';
import 'package:onyx/features/Archiving-System/home/archiving_grid.dart';
import 'package:onyx/features/Archiving-System/home/cont.dart';
import 'package:onyx/features/Archiving-System/home/header_table.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/menu_section.dart';

class ArchivingPage extends StatelessWidget {
  const ArchivingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F9FF),
      endDrawer: Drawer(
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF819AA7).withOpacity(0.4),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
                height: 122,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Image.asset(
                        'assets/images/onix_logo.png',
                        height: 80,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: ListView(
                      children: const [
                        Text(
                          'القائمة الرئيسية',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF819AA7),
                            fontFamily: 'Readex Pro',
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 6),
                        MenuSection(
                          title: ' إدارة النظام ',
                          icon: Icons.account_balance_outlined,
                          subItems: [
                            'نظام الأرشفة',
                          ],
                        ),
                        MenuSection(
                          title: 'نظام إدارة الحسابات',
                          icon: Icons.account_balance_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة الخطط والموازنة',
                          icon: Icons.assessment_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة الاصول',
                          icon: Icons.inventory_2_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة المخازن',
                          icon: Icons.store_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة راس المال البشري',
                          icon: Icons.people_outline,
                        ),
                        MenuSection(
                          title: 'نظام الإدارة اللوجيستية',
                          icon: Icons.local_shipping_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة الموردين والمشتريات',
                          icon: Icons.shopping_cart_outlined,
                          subItems: const [
                            'نظام الشحن',
                          ],
                        ),
                        MenuSection(
                          title: 'نظام إدارة العملاء والمبيعات',
                          icon: Icons.point_of_sale_outlined,
                          subItems: const [
                            'نظام طلبات العملاء',
                            'نظام الأرشفة',
                            'نظام المخازن',
                          ],
                        ),
                        MenuSection(
                          title: 'نظام إدارة نقاط البيع',
                          icon: Icons.storefront_outlined,
                          subItems: const [
                            'نظام البيع المباشر',
                          ],
                        ),
                        MenuSection(
                          title: 'نظام إدارة الموارد التسويقية',
                          icon: Icons.campaign_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة المشاريع',
                          icon: Icons.architecture_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة العقارات',
                          icon: Icons.apartment_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة الحج والعمرة',
                          icon: Icons.mosque_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة الحجوزات',
                          icon: Icons.calendar_month_outlined,
                        ),
                        MenuSection(
                          title: 'نظام إدارة المستشفيات',
                          icon: Icons.local_hospital_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Appbar(),
            Padding(
              padding: ResponsiveUtils.getPagePadding(context),
              child: const ShippingBreadcrumb(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    HeaderTableOrders(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: CustomGrid(),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    PaginationExample(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ListTile _createDrawerItem(IconData icon, String text) {
  return ListTile(
    title: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
    leading: Icon(icon, color: Colors.blue),
    onTap: () {
      // Add navigation logic here if necessary
    },
  );
}

Widget _buildCheckbox(String label, BuildContext context) {
  return Row(
    children: [
      Text(label),
      Theme(
          data: Theme.of(context).copyWith(
            checkboxTheme: CheckboxThemeData(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              side: const BorderSide(color: Color(0xffe2e2e2), width: 0.5),
            ),
          ),
          child: Checkbox(value: false, onChanged: (bool? value) {})),
    ],
  );
}

Widget build(BuildContext context) {
  var isCollapsed;
  return Container(
    child: Text(isCollapsed ? 'Collapsed' : 'Expanded'),
  );
}
