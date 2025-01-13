import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/home/shipping_appbar.dart';
import 'package:onyx/features/sales_system/summary_totals.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/menu_section.dart';

import 'package:flutter/material.dart';
import 'package:onyx/features/sales_system/features/new_customer_order/widgets/mainmenu.dart';

class DashboardPage extends StatelessWidget {
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
                        ),
                        MenuSection(
                          title: 'نظام إدارة العملاء والمبيعات',
                          icon: Icons.point_of_sale_outlined,
                          subItems: const [
                            'نظام طلبات العملاء',
                            'نظام البيع المباشر',
                            'نظام الشحن',
                          ],
                        ),
                        MenuSection(
                          title: 'نظام إدارة نقاط البيع',
                          icon: Icons.storefront_outlined,
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
            Shippingappbar(),
            Mainmenu(),
          ],
        ),
      ),
      bottomNavigationBar: const SummaryPanel(),
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
