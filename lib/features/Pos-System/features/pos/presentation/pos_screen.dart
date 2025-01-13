import 'package:onyx/core/appbar/header_widget.dart';
import 'package:onyx/core/appbar/ivoicestatus.dart';
import 'package:onyx/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/cubit/cubit.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/cubit/state.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/empte_products_management/products_list_view.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/payment/pyment_widget.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/product/products_grid.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/product/side_panel.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/menu_section.dart';

class POSScreen extends StatelessWidget {
  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F9FF),
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
                          subItems: const [
                            'نظام الشحن',
                          ],
                        ),
                        MenuSection(
                          title: 'نظام إدارة العملاء والمبيعات',
                          icon: Icons.point_of_sale_outlined,
                          subItems: const [
                            'نظام طلبات العملاء',
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
      body: BlocBuilder<InvoiceCubit1, InvoiceState1>(
        builder: (context, state) {
          return Column(
            children: [
              const HeaderWidget(),
              const SizedBox(
                height: 10,
              ),
              const InvoiceStatus(),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding:
                            const EdgeInsets.all(AppConstants.defaultPadding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (state.settingMultiablePayment)
                              const Paymentwidget()
                            else ...[
                              const Expanded(child: ProductListView()),
                              const SizedBox(width: 10),
                              if (!state.haedproductgrid)
                                const Expanded(child: ProductGrid()),
                            ],
                            const SizedBox(width: 5),
                            const SidePanel(),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
