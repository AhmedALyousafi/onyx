import 'package:flutter/material.dart';
import 'package:onyx/core/appbar/appbar.dart';
import 'package:onyx/core/utils/responsive.dart';
import 'package:onyx/features/Warehouse-System/features/warehouse/presentation/pages/home/drawer_widget.dart';
import 'package:onyx/features/Warehouse-System/features/warehouse/presentation/pages/home/warehouse_breadcrumb.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Appbar(),
        Expanded(
          child: Padding(
            padding: ResponsiveUtils.getPagePadding(context),
            child: const Column(
              children: [
                ShippingBreadcrumb(),
                WarehouseSystem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
