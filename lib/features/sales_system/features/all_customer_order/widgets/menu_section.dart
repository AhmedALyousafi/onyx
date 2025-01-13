import 'package:onyx/core/cubit/cubit.dart';
import 'package:onyx/core/cubit/state.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/cubit/cubit.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/cubit/state.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/pos_screen.dart';
import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/home/drawer_widget.dart';
import 'package:onyx/features/sales_system/cubit/cubit.dart';
import 'package:onyx/features/sales_system/cubit/state.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/view/custome_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/menu_Item.dart';

class MenuSection extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isExpanded;
  final List<String>? subItems;

  const MenuSection({
    super.key,
    required this.title,
    required this.icon,
    this.isExpanded = false,
    this.subItems,
  });

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  void _navigateToCustomerOrders(
      BuildContext context, CustomerOrdersState state) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => CustomerOrdersCubit(state as CustomerOrdersState?),
        child: MaterialApp(
          title: 'Customer Orders System',
          theme: ThemeData(
            primaryColor: const Color(0xFF094F90),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF094F90),
            ),
            fontFamily: 'Readex Pro',
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: CustomeRequest(),
        ),
      ),
    ));
  }

  void _navigateToPOS(BuildContext context, InvoiceState1 state) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => InvoiceCubit1(state as InvoiceState1?),
        child: MaterialApp(
          title: 'POS System',
          theme: ThemeData(
            primaryColor: const Color(0xFF094F90),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF094F90),
            ),
            fontFamily: 'Readex Pro',
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: POSScreen(),
        ),
      ),
    ));
  }

  void _navigateToShipping(BuildContext context, InvoiceState state) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => InvoiceCubit(state),
        child: MaterialApp(
          title: 'Shipping System',
          theme: ThemeData(
            primaryColor: const Color(0xFF094F90),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF094F90),
            ),
            fontFamily: 'Readex Pro',
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: CustomeRequest1(),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          title: widget.title,
          icon: widget.icon,
          isActive: _isExpanded,
          onTap: widget.subItems != null
              ? () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                }
              : null,
        ),
        if (_isExpanded && widget.subItems != null)
          ...widget.subItems!.map(
            (subItem) => Padding(
              padding: const EdgeInsets.only(right: 24),
              child: MenuItem(
                title: subItem,
                icon: Icons.circle_outlined,
                onTap: () {
                  if (subItem == 'نظام طلبات العملاء') {
                    _navigateToCustomerOrders(
                      context,
                      CustomerOrdersState(),
                    );
                  } else if (subItem == 'نظام البيع المباشر') {
                    _navigateToPOS(
                      context,
                      InvoiceState1(),
                    );
                  } else if (subItem == 'نظام الشحن') {
                    _navigateToShipping(
                      context,
                      InvoiceState(),
                    );
                  }
                },
              ),
            ),
          ),
      ],
    );
  }
}
