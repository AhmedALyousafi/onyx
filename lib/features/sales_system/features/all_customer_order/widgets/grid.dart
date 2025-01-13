import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/core/cubit/cubit.dart';
import 'package:onyx/core/cubit/state.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/features/sales_system/cubit/cubit.dart';
import 'package:onyx/features/sales_system/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({super.key});

  @override
  State<CustomGrid> createState() => CustomGridState();
}

class CustomGridState extends State<CustomGrid> {
  late List<PlutoRow> rows;
  late List<PlutoColumn> columns;

  @override
  void initState() {
    super.initState();
    // columns = <PlutoColumn>[
    //   PlutoColumn(
    //       title: 'رقم الوثيقة',
    //       field: 'Document_number',
    //       type: PlutoColumnType.text(),
    //       textAlign: PlutoColumnTextAlign.center,
    //       titleTextAlign: PlutoColumnTextAlign.center,
    //       backgroundColor: AppColors.blue,
    //       enableRowChecked: true,
    //       renderer: (rendererContext) {
    //         return TextButton(
    //           onPressed: () {
    //             Navigator.push(context, MaterialPageRoute(builder: (context) {
    //               return DashboardPage();
    //             }));
    //           },
    //           child: Text(
    //             rendererContext.row.cells['Document_number']!.value.toString(),
    //             style: TextStyle(
    //                 fontWeight: FontWeight.w400,
    //                 fontFamily: 'ReadexPro',
    //                 fontSize: 12,
    //                 color: const Color(0xFF00B4D8),
    //                 decoration: TextDecoration.underline),
    //           ),
    //         );
    //       }),
    //   PlutoColumn(
    //     title: 'تاريخ الوثيقة',
    //     field: 'Document_history',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'النوع ',
    //     field: 'Type',
    //     type: PlutoColumnType.number(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'الاسم',
    //     field: 'name',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //       title: 'طرق الدفع ',
    //       field: 'Payment_methods',
    //       type: PlutoColumnType.text(),
    //       textAlign: PlutoColumnTextAlign.center,
    //       titleTextAlign: PlutoColumnTextAlign.center,
    //       backgroundColor: AppColors.blue,
    //       minWidth: 500,
    //       width: 300,
    //       renderer: (rendererContext) {
    //         List<String> paymenMethods =
    //             List<String>.from(rendererContext.cell.value);
    //         return Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: paymenMethods
    //               .map((method) => _createPaymentChip(method))
    //               .toList(),
    //         );
    //       }),
    //   PlutoColumn(
    //     title: 'اسم العميل',
    //     field: 'customer_name',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'العملة',
    //     field: 'Currency',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'اسم المخزن',
    //     field: 'Numerical_unit',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'رقم المرجع  ',
    //     field: 'reference_nubmer',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //       title: 'البيان',
    //       field: 'statement',
    //       type: PlutoColumnType.number(),
    //       textAlign: PlutoColumnTextAlign.center,
    //       titleTextAlign: PlutoColumnTextAlign.center,
    //       backgroundColor: AppColors.blue),
    //   PlutoColumn(
    //     title: 'رقم الهاتف',
    //     field: 'telephone_number',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'الوحدة المالية',
    //     field: 'financial_unit',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'حالة الاعتماد',
    //     field: 'accreditaion_state',
    //     type: PlutoColumnType.text(),
    //     textAlign: PlutoColumnTextAlign.center,
    //     titleTextAlign: PlutoColumnTextAlign.center,
    //     backgroundColor: AppColors.blue,
    //   ),
    //   PlutoColumn(
    //     title: 'رقم العقد ',
    //     field: 'salary',
    //     type: PlutoColumnType.number(),
    //   ),
    // ];

    rows = [
      PlutoRow(
        cells: {
          'Document_number': PlutoCell(value: '600014-98'),
          'Document_history': PlutoCell(value: '14ياناير 2024'),
          'Type': PlutoCell(value: 'نوع الوثيقة الفرعية'),
          'name': PlutoCell(value: 'طلبات عملاء الشركات'),
          'Payment_methods':
              PlutoCell(value: ["   نقدي ", "  اجل ", "      من حساب   "]),
          'customer_name': PlutoCell(value: '60001-شركة الاتحاد'),
          'Currency': PlutoCell(value: 'EGP'),
          'Numerical_unit': PlutoCell(value: 'اسم المخزن'),
          'reference_nubmer': PlutoCell(value: '5'),
          'statement': PlutoCell(value: 'طلب عميل بتاريخ23/7/2024'),
          'telephone_number': PlutoCell(value: '0222222247'),
          'financial_unit': PlutoCell(value: '301-فرع الدمام'),
          'accreditaion_state': PlutoCell(value: 'طلب جديد'),
          'salary': PlutoCell(value: 2),
        },
      ),
      PlutoRow(
        cells: {
          'Document_number': PlutoCell(value: '600014-98'),
          'Document_history': PlutoCell(value: '16ياناير 2024'),
          'Type': PlutoCell(value: 'نوع الوثيقة الفرعية'),
          'name': PlutoCell(value: 'طلبات عملاء الشركات'),
          'Payment_methods': PlutoCell(value: ["  نقدي  ", "  اجل  "]),
          'customer_name': PlutoCell(value: '2451-شركة المجد للسجاد'),
          'Currency': PlutoCell(value: 'EGP'),
          'Numerical_unit': PlutoCell(value: 'اسم المخزن'),
          'reference_nubmer': PlutoCell(value: '4'),
          'statement': PlutoCell(value: 'طلب عميل بتاريخ23/7/2024'),
          'telephone_number': PlutoCell(value: '0222222247'),
          'financial_unit': PlutoCell(value: '301-فرع الدمام'),
          'accreditaion_state': PlutoCell(value: 'ملغي'),
          'salary': PlutoCell(value: 2),
        },
      ),
      PlutoRow(
        cells: {
          'Document_number': PlutoCell(value: '240014-222'),
          'Document_history': PlutoCell(value: 'Mike'),
          'Type': PlutoCell(value: 'نوع الوثيقة الفرعية'),
          'name': PlutoCell(value: 'طلبات عملاء الشركات'),
          'Payment_methods': PlutoCell(value: ["   بنكي "]),
          'customer_name': PlutoCell(value: '09:02021-01-0'),
          'Currency': PlutoCell(value: 'EGP'),
          'Numerical_unit': PlutoCell(value: 'اسم المخزن'),
          'reference_nubmer': PlutoCell(value: '13'),
          'statement': PlutoCell(value: 'طلب عميل بتاريخ23/7/2024'),
          'telephone_number': PlutoCell(value: '0222222247'),
          'financial_unit': PlutoCell(value: '301-فرع الدمام'),
          'accreditaion_state': PlutoCell(value: 'معتمد'),
          'salary': PlutoCell(value: 2),
        },
      ),
    ];
  }

  PlutoGridStateManager? stateManager;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        context.read<InvoiceCubit>().getAllOrders();
        if (context.read<InvoiceCubit>().rows.isNotEmpty &&
            context.read<InvoiceCubit>().columns.isNotEmpty)
          return Container(
            padding: const EdgeInsets.all(15),
            child: PlutoGrid(
              columns: context.read<InvoiceCubit>().columns,
              rows: context.read<InvoiceCubit>().rows,
              onLoaded: (event) {
                stateManager = event.stateManager;
                stateManager?.setShowColumnFilter(false);
              },
              onChanged: (event) {
                print(event);
              },
              configuration: const PlutoGridConfiguration(
                  style: PlutoGridStyleConfig(
                      gridBorderColor: Colors.transparent,
                      cellTextStyle: TextStyle(fontSize: 12),
                      oddRowColor: Colors.white,
                      evenRowColor: Color(0xffF9F9F9),
                      columnTextStyle: TextStyle(color: Colors.white))),
            ),
          );
        else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

Widget _createPaymentChip(String method) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Chip(
      backgroundColor: const Color(0xffEBF9FF),
      labelStyle: const TextStyle(
          color: Color(0xff00B4D8), fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Color(0xffD2ECFC))),
      label: Text(
        method,
        style: const TextStyle(fontSize: 10),
      ),
    ),
  );
}
