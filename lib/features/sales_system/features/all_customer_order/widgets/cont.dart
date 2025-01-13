import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/adaptivelayout.dart';
import 'package:onyx/core/theme/app_colors.dart';

class PaginationExample extends StatelessWidget {
  const PaginationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AdaptiveLayout(
          desktopLayout: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemsPerPageDropdown(),
              const SizedBox(width: 16),
              const Text('عدد العناصر في الصفحة'),
              const Spacer(),
              _buildPaginationControls(context),
            ],
          ),
          tabletLayout: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemsPerPageDropdown(),
              const SizedBox(width: 16),
              const Text('عدد العناصر في الصفحة'),
              const Spacer(),
              _buildPaginationControls(context),
            ],
          ),
          mobileLayout: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemsPerPageDropdown(),
              const SizedBox(width: 16),
              const Spacer(),
              _buildPaginationControls(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemsPerPageDropdown() {
    return SizedBox(
      height: 30,
      width: 85,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField2<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3), // تحديد زاوية الحدود
              borderSide: const BorderSide(
                  color: AppColors.blue, width: 1), // لون وسماكة الحدود
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 1), // الحدود عند تفعيلها
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(
                  color: AppColors.blue, width: 2), // الحدود عند التركيز
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
          ),
          value: '15',
          items: const [
            DropdownMenuItem(value: '10', child: Text('10')),
            DropdownMenuItem(value: '15', child: Text('15')),
            DropdownMenuItem(value: '20', child: Text('20')),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildPaginationControls(BuildContext context) {
    // ignore: unused_local_variable
    var screenWidth = MediaQuery.of(context).size.width > 750;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(
            Icons.keyboard_double_arrow_left,
            color: Color(0xff819AA7),
          ),
          const Icon(
            Icons.chevron_left,
            color: Color(0xff819AA7),
          ),
          const SizedBox(width: 10),
          _buildPageNumber(context, '25'),
          const SizedBox(width: 10),
          const Text('...'),
          const SizedBox(width: 10),
          _buildPageNumber(context, '5'),
          const SizedBox(width: 10),
          _buildPageNumber(context, '4'),
          const SizedBox(width: 10),
          _buildPageNumber(context, '3'),
          const SizedBox(width: 10),
          _buildPageNumber(context, '2'),
          const SizedBox(width: 10),
          _buildPageNumber(context, '1', isSelected: true),
          const Icon(
            Icons.chevron_right,
            color: Color(0xff819AA7),
          ),
          const Icon(
            Icons.keyboard_double_arrow_right,
            color: Color(0xff819AA7),
          ),
        ],
      ),
    );
  }

  Widget _buildPageNumber(BuildContext context, String number,
      {bool isSelected = false}) {
    // Determine the screen size

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ?  AppColors.blue : AppColors.grid,
        shape: BoxShape.circle,
      ),
      child: Text(
        number,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xff819AA7),
        ),
      ),
    );
  }
}
