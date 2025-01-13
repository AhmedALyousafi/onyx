import 'package:onyx/core/responsive/widgetbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onyx/core/theme/app_colors.dart';

class PrintDialog extends StatefulWidget {
  const PrintDialog({super.key});

  @override
  State<PrintDialog> createState() => _PrintDialogState();
}

class _PrintDialogState extends State<PrintDialog> {
  String? selectedLanguage;
  String? selectedTemplate;
  int numberOfCopies = 1;
  bool showPdf = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(11),
          ),
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'خيارات الطباعة',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF474747),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'ReadexPro'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    // lable: 'عدد النسخ*',
                    enabled: true,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropDownButtonWidget(items: [
                      'لغة عربية',
                      'لغة انجليزية',
                      'لغة المانية',
                      'لغة روسية ',
                    ], label: 'اللغة*'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const DropDownButtonWidget(items: [
                'نموذج 1',
                'نموذج 2',
                'نموذج 3',
                'نموذج 4',
              ], label: 'رقم النموذج*'),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        showPdf = true;
                      });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.white,
                      size: 14,
                    ),
                    label: const Text(
                      'عرض',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'ReadexPro',
                          fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      minimumSize: const Size(0, 36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      backgroundColor:  AppColors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.print,
                      color: Colors.white,
                      size: 14,
                    ),
                    label: const Text(
                      'طباعة',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'ReadexPro',
                          fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      minimumSize: const Size(0, 36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      backgroundColor: const Color(0xFF319626),
                    ),
                  ),
                ],
              ),
              const Divider(
                endIndent: 5,
                indent: 5,
                color: Color(0xFFE2E2E2),
                thickness: 1,
              ),
              _expansionTile(),
              const SizedBox(height: 16.0),
              if (showPdf)
                SizedBox(
                  height: 300,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _expansionTile() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grid,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 10.0),
            title: const Text('البريد الالكتروني'),
            children: [
              SizedBox(
                height: 160,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'المستلم*',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 8.0),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text('0.00'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'عنوان الرسالة*',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 8.0),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text('0.00'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'نص الرسالة*',
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text('0.00'),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          label: const Text(
                            'إرسال الملف',
                            style: TextStyle(color: Colors.blue),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 12.0),
                            minimumSize: const Size(0, 36),
                            shape: BeveledRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(3)),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupMenu({
    required String label,
    required String? selectedItem,
    required List<String> items,
    required Function(String) onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        LayoutBuilder(
          builder: (context, constraints) {
            return PopupMenuButton<String>(
              onSelected: (value) {
                onSelected(value);
              },
              offset: const Offset(0, 40),
              itemBuilder: (BuildContext context) {
                final double popupWidth = constraints.maxWidth;

                return items.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: SizedBox(
                      width: popupWidth,
                      child: Directionality(
                          textDirection: TextDirection.rtl, child: Text(item)),
                    ),
                  );
                }).toList();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedItem ?? 'اختر $label'),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
