import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onyx/core/responsive/adaptivelayout.dart';
import 'package:onyx/core/theme/app_colors.dart';

class HeaderAllOrder extends StatelessWidget {
  const HeaderAllOrder({
    super.key,
    this.isCollapsed = false,
    required this.title,
    required this.icon,
  });

  final bool isCollapsed;
  final String title;
  final IconData icon;

  static const Color primaryColor = AppColors.blue;
  static const Color secondaryColor = Color(0xfff4f4f4);
  static const Color dividerColor = Color(0xFFE2E2E2);
  static const Color textColor = Color(0XFF4B4B4B);
  static const Color greyColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      desktopLayout: _buildHeader(context, isCollapsed: isCollapsed),
      tabletLayout: _buildHeader(context, rightPadding: 16),
      mobileLayout: _buildMobileHeader(context),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    bool isCollapsed = false,
    double rightPadding = 20,
  }) {
    rightPadding = isCollapsed ? 95 : rightPadding;
    return Padding(
      padding:
          EdgeInsets.only(top: 20, right: rightPadding, left: 16, bottom: 10),
      child: _headerContainer(
        context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _dateContainer(),
            const VerticalDivider(
              color: dividerColor,
              thickness: 1,
              indent: 5,
            ),
            const Spacer(),
            _customerAccountsButton(),
            const SizedBox(width: 10),
            _currentOrderButton(title),
            const VerticalDivider(
              color: dividerColor,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            _dashboardLabel(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 25.0,
          right: 16,
          left: 16,
          bottom: 16.0),
      child: _headerContainer(
        context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _dateContainer(),
            const VerticalDivider(
              color: dividerColor,
              thickness: 5,
            ),
            const Spacer(),
            _mobileCurrentOrderButton(title, icon),
          ],
        ),
      ),
    );
  }

  Widget _headerContainer(BuildContext context, {required Widget child}) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _dateContainer() {
    return Container(
      height: 25,
      width: 90,
      margin: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '1 مايو 2024',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontFamily: 'ReadexPro',
                fontWeight: FontWeight.w300,
                fontSize: 11),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.calendar_month_outlined,
            color: Color(0xff819aa7),
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _buttonWithIcon({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color labelColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffD2ECFC),
                ),
                child: const Icon(
                  Icons.close, // The "X" icon
                  color: AppColors.blue, // Icon color
                  size: 20,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: labelColor,
                  fontFamily: 'ReadexPro',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dashboardLabel() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'لوحة التحكم',
            style: TextStyle(
              color: greyColor,
              fontFamily: 'ReadexPro',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          SizedBox(width: 5),
          Icon(Icons.folder_open, color: greyColor, size: 18),
        ],
      ),
    );
  }

  Widget _mobilePopupMenu(IconData icon) {
    return PopupMenuButton(
      tooltip: '',
      offset: const Offset(0, 35),
      surfaceTintColor: Colors.white,
      itemBuilder: (context) => [
        _popupMenuItem('جميع طلبات العملاء'),
        _popupMenuItem('فاتورة المبيعات - 23459'),
        _popupMenuItem('طلب عميل - 25640001'),
        _popupMenuItem('جميع  فواتير المبيعات'),
        _popupMenuItem('لوحة التحكم'),
      ],
      child: Icon(icon, color: primaryColor, size: 15),
    );
  }

  Widget _customerAccountsButton() {
    return _buttonWithIcon(
      label: 'حسابات العملاء',
      icon: Icons.close,
      backgroundColor: Color(0xffF),
      labelColor: primaryColor,
    );
  }

  Widget _currentOrderButton(String label) {
    return _buttonWithIcon(
      icon: Icons.close,
      label: label,
      backgroundColor: primaryColor,
      labelColor: Colors.white,
    );
  }

  Widget _mobileCurrentOrderButton(String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(
                color: primaryColor,
                fontFamily: 'ReadexPro',
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 5),
            _mobilePopupMenu(icon),
          ],
        ),
      ),
    );
  }

  PopupMenuItem _popupMenuItem(String label) {
    return PopupMenuItem(
      height: BorderSide.strokeAlignCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {},
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF474747),
                fontFamily: 'ReadexPro',
                fontWeight: FontWeight.w300,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Icon(FontAwesomeIcons.circleArrowLeft,
              color: Color(0xFF819AA7), size: 12),
        ],
      ),
    );
  }
}
