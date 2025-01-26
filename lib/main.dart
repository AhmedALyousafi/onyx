import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/core/cubit/cubit.dart';
import 'package:onyx/features/Archiving-System/cubit/cubit.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/cubit/cubit.dart';
import 'package:onyx/features/Warehouse-System/cubit/cubit.dart';
import 'package:onyx/features/login/screnn/login.dart';
import 'package:onyx/features/sales_system/cubit/cubit.dart';

void main() {
  runApp(const Onyx());
}

class Onyx extends StatelessWidget {
  const Onyx({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerOrdersCubit>(
          create: (context) => CustomerOrdersCubit(),
        ),
        BlocProvider<InvoiceCubit1>(
          create: (context) => InvoiceCubit1(),
        ),
        BlocProvider<InvoiceCubit>(
          create: (context) => InvoiceCubit(),
        ),
        BlocProvider<ArchivingCubit>(
          create: (context) => ArchivingCubit(),
        ),
        BlocProvider<WarehouseSystemCubit>(
          create: (context) => WarehouseSystemCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Customer and Sales Management',
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
