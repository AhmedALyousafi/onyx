import 'package:onyx/core/constants/app_constants.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/widgets/app_button.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/cubit/cubit.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/cubit/state.dart';

import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/beneficiary/beneficiary_page.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/dashboard_menu/dashboard_menu.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/payment_module/payment_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit1, InvoiceState1>(
      builder: (context, state) {
        var cubit = BlocProvider.of<InvoiceCubit1>(context);

        // إذا كانت الحالة "calculator" صحيحة، يتم عرض صفحة الدفع فقط.
        if (state.calculator) {
          return SizedBox(width: 332, height: 750, child: PaymentScreen());
        }

        // إذا كانت الحالة "calculator" غير صحيحة، يتم عرض باقي محتويات الـ SidePanel.
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
            width: AppConstants.sidePanelWidth,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius:
                  BorderRadius.circular(AppConstants.defaultBorderRadius),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultSpacing),
                  child: Row(
                    children: [
                      AppButton(
                        onPressed: () {
                          cubit.changehaedproductgrid(!state.haedproductgrid);
                        },
                        color: Color(0xFF319626),
                        width: 35,
                        height: 35,
                        child: const Icon(
                          Icons.arrow_right_alt_sharp,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(width: AppConstants.defaultSpacing),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F9FF),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: AppButton(
                            onPressed: () {
                              // تبديل حالة calculator
                              cubit.changeCalculator(!state.calculator);
                            },
                            color: Color(0xFFF2F2F2),
                            width: 35,
                            height: 35,
                            child: const Icon(
                              (FontAwesomeIcons.downLeftAndUpRightToCenter),
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(AppConstants.defaultSpacing),
                    children: [
                      _buildAmountCard(
                        context,
                        'المبلغ المطلوب',
                        '0.00',
                        Color(0xFFDC292F),
                        AppColors.error.withOpacity(0.1),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      _buildAmountCard(
                        context,
                        'المبلغ النقدي',
                        '0.00',
                        Color(0xff474747),
                        Color(0xffE2E2E2),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      _buildAmountCard(
                        context,
                        'مبلغ البطاقة',
                        '0.00',
                        Color(0xff474747),
                        Color(0xffE2E2E2),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      _buildAmountCard(
                        context,
                        'المبلغ المتبقي',
                        '0.00',
                        Color(0xFF319626),
                        AppColors.success.withOpacity(0.1),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 0.5),
                Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultSpacing),
                  child: Column(
                    children: [
                      AppButton(
                        onPressed: () {},
                        color: Color(0xFF319626),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.payments_outlined,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {},
                        color: AppColors.blue,
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.payment_outlined,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {
                          context
                              .read<InvoiceCubit1>()
                              .changesettingMultiablePayment();
                        },
                        color: const Color(0xFFD2ECFC),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.settings,
                          color: AppColors.blue,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {},
                        color: Color(0xFFF69B42),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.pause_circle,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () => _showBeneficiaryDialog(context),
                        color: Color(0xFFF2F2F2),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.line_weight_sharp,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () => _showBeneficiaryScreen(context),
                        color: Color(0xffEBF9FF),
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.person_sharp,
                          color: AppColors.blue,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultSpacing),
                      AppButton(
                        onPressed: () {},
                        color: Colors.red[50] ?? Colors.red,
                        width: 101,
                        height: 35,
                        child: const Icon(
                          Icons.percent,
                          color: Color(0xFFDC292F),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAmountCard(
    BuildContext context,
    String title,
    String amount,
    Color textColor,
    Color backgroundColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultSpacing),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            amount,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  void _showBeneficiaryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: DashboardMenu(context),
      ),
    );
  }

  void _showBeneficiaryScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(),
      builder: (context) => const BeneficiaryPage(),
    );
  }
}
