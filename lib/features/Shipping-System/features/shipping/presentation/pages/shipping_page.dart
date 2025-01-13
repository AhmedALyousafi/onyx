import 'package:onyx/core/utils/responsive.dart';
import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/home/drawer_widget.dart';
import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/home/shipping_appbar.dart';
import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/home/shipping_breadcrumb.dart';

import 'package:flutter/material.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Shippingappbar(),
        Expanded(
          child: Padding(
            padding: ResponsiveUtils.getPagePadding(context),
            child: const Column(
              children: [
                ShippingBreadcrumb(),
                CustomeRequest1(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
