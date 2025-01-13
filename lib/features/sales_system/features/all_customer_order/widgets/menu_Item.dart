import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final bool isSubItem;
  final bool hasSubItems;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.isActive = true,
    this.isSubItem = true,
    this.hasSubItems = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: title,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isActive ? const Color(0xFFF5F5F5) : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (hasSubItems)
                  AnimatedRotation(
                    turns: isActive ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      icon,
                      size: 18,
                      color:  AppColors.blue,
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color(0xFF474747),
                      fontFamily: 'Readex Pro',
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: AppColors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
