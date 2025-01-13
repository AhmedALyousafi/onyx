import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/home/shipping_appbar.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/cont.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/grid.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/header_order.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/headertable.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeRequest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F9FF),
      endDrawer: Drawer(
        child: Container(
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
                          title: 'نظام إدارة العملاء',
                          icon: Icons.person_outline,
                          subItems: [],
                        ),
                        MenuSection(
                          title: 'نظام إدارة المبيعات',
                          icon: Icons.point_of_sale_outlined,
                          subItems: [
                            'نظام إدارة العملاء',
                            'نظام إدارة المبيعات',
                            'نظام العمولات',
                            'نظام الصيانة',
                          ],
                        ),
                        MenuSection(
                          title: 'نظام العمولات',
                          icon: Icons.attach_money,
                          subItems: [],
                        ),
                        MenuSection(
                          title: 'نظام الصيانة',
                          icon: Icons.build,
                          subItems: [],
                        ),
                        // يمكنك إضافة المزيد من العناصر هنا
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
            HeaderAllOrder(
              title: 'جميع طلبات العملاء',
              icon: FontAwesomeIcons.chevronRight,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
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
                    const SizedBox(height: 0),
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

class MenuSection extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> subItems;

  const MenuSection({
    super.key,
    required this.title,
    required this.icon,
    required this.subItems,
  });

  @override
  _MenuSectionState createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(widget.icon, color: Colors.blue),
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 16),
          ),
          onTap: _toggleExpand,
        ),
        if (_isExpanded) ...[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: widget.subItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const SizedBox(width: 24), // محاذاة النص
                      Text(item, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}
