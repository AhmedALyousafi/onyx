import 'package:flutter/material.dart';
import 'package:onyx/core/model/newitemmodel.dart';
import 'package:onyx/core/responsive/adaptivelayout.dart';
import 'package:onyx/core/theme/app_colors.dart';

class IconOrder extends StatelessWidget {
  List<MenuItemModel> record = [
    MenuItemModel(
        text: 'اضافه من',
        icon: Icons.note_add_rounded,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'اضافة سجل',
        icon: Icons.add_box_rounded,
        iconColor: Colors.green,
        onPressed: () {}),
    MenuItemModel(
        text: 'تعديل سجل ',
        icon: Icons.drive_file_rename_outline_outlined,
        iconColor: Colors.orange,
        onPressed: () {}),
    MenuItemModel(
        text: 'حذف سجل',
        icon: Icons.delete_rounded,
        iconColor: Colors.red,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل الأول',
        icon: Icons.arrow_forward_ios_rounded,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل السابق',
        icon: Icons.double_arrow_rounded,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل التالي',
        icon: Icons.arrow_back_ios,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل الأخير',
        icon: Icons.keyboard_double_arrow_left,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'استيراد',
        icon: Icons.save_rounded,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
  ];
  List<MenuItemModel> inquiry = [
    MenuItemModel(
        text: 'بحث',
        icon: Icons.search,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'بحث في البيانات التفصيلية',
        icon: Icons.file_present_rounded,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
  ];
  List<MenuItemModel> procedure = [
    MenuItemModel(
        text: 'حفظ',
        icon: Icons.save,
        iconColor: Colors.green,
        onPressed: () {}),
    MenuItemModel(
        text: 'فتح شاشة جديدة',
        icon: Icons.open_in_new,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'التقارير',
        icon: Icons.pie_chart,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'قفل الشاشة',
        icon: Icons.lock,
        iconColor: Colors.red,
        onPressed: () {}),
    MenuItemModel(
        text: 'شاشات النظام',
        icon: Icons.screen_share_rounded,
        iconColor: Colors.orange,
        onPressed: () {}),
    MenuItemModel(
        text: 'الطباعة',
        icon: Icons.print,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'تراجع',
        icon: Icons.settings_backup_restore_sharp,
        iconColor: Colors.green,
        onPressed: () {}),
    MenuItemModel(
        text: 'خروج',
        icon: Icons.close,
        iconColor: Colors.red,
        onPressed: () {}),
  ];
  List<MenuItemModel> edit = [
    MenuItemModel(
        text: 'قص',
        icon: Icons.carpenter_outlined,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'نسخ',
        icon: Icons.copy,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'لصق',
        icon: Icons.content_copy,
        iconColor: Colors.blue,
        onPressed: () {}),
    MenuItemModel(
        text: 'عرض قائمة',
        icon: Icons.arrow_downward,
        iconColor: Colors.green,
        onPressed: () {}),
  ];
  List<MenuItemModel> operations = [
    MenuItemModel(
        text: 'الاعتمادات',
        icon: Icons.menu,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'عرض قيد اليومية',
        icon: Icons.storage_rounded,
        iconColor: Colors.grey,
        onPressed: () {}),
    MenuItemModel(
        text: 'أرشفة الوثائق',
        icon: Icons.folder_copy_rounded,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'التوقيف',
        icon: Icons.block,
        iconColor: Colors.red,
        onPressed: () {}),
    MenuItemModel(
        text: 'رقابة النظام',
        icon: Icons.visibility,
        iconColor: Colors.orange,
        onPressed: () {}),
    MenuItemModel(
        text: 'تعديل النصوص',
        icon: Icons.text_fields,
        iconColor: Colors.black,
        onPressed: () {}),
    MenuItemModel(
        text: 'متغيرات الشاشة',
        icon: Icons.sync,
        iconColor: Colors.green,
        onPressed: () {}),
  ];
  List<MenuItemModel> help = [
    MenuItemModel(
        text: 'المساعدة',
        icon: Icons.help_outline,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'المفاتيح',
        icon: Icons.keyboard,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'عرض الأخطاء',
        icon: Icons.error,
        iconColor: Colors.red,
        onPressed: () {}),
  ];
  IconOrder({
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
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: _headerContainer(
        context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const VerticalDivider(
              color: dividerColor,
              thickness: 1,
              indent: 5,
            ),
            const SizedBox(width: 10),
            _currentOrderButton(title),
            const VerticalDivider(
              color: Color(0xff000000),
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1),
      child: _headerContainer(
        context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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

  Widget _buttonWithIcon({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color labelColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xffD2ECFC),
              ),
              child: const Icon(
                Icons.close, // The "X" icon
                color: Color(0xff000000), // Icon color
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
    );
  }

  Widget _mobilePopupMenu(IconData icon) {
    return PopupMenuButton(
      tooltip: '',
      offset: const Offset(0, 35),
      surfaceTintColor: Colors.white,
      itemBuilder: (context) => [
        _popupMenuItem('سجل'),
        _popupMenuItem('استعلام'),
        _popupMenuItem('اجراء'),
        _popupMenuItem('تحرير'),
        _popupMenuItem('عمليات'),
        _popupMenuItem('مساعدة'),
      ],
      child: Icon(icon, color: Color(0xff319626), size: 15),
    );
  }

  Widget _currentOrderButton(String label) {
    return _buttonWithIcon(
      icon: Icons.close,
      label: label,
      backgroundColor: Color(0xff319626),
      labelColor: Color(0xff319626),
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
                color: Color(0xff000000),
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
          Icon(Icons.keyboard_arrow_down),
          const SizedBox(width: 5),
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
        ],
      ),
    );
  }
}
