import 'package:flutter/material.dart';
import 'package:onyx/core/appbar/header_widget.dart';
import 'package:onyx/core/utils/responsive.dart';
import 'package:onyx/features/Archiving-System/home/archiving_breadcrumb.dart';
import 'package:onyx/features/Archiving-System/home/drawer_widget.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(),
        Expanded(
          child: Padding(
            padding: ResponsiveUtils.getPagePadding(context),
            child: const Column(
              children: [
                ShippingBreadcrumb(),
                ArchivingPage(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
