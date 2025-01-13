import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExportFildDialog extends StatefulWidget {
  const ExportFildDialog({super.key});

  @override
  State<ExportFildDialog> createState() => _ExportFildDialogState();
}

class _ExportFildDialogState extends State<ExportFildDialog> {
  String? selectedFormat; // Initialize with null
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xfff9f9f9),
            borderRadius: BorderRadius.circular(11),
          ),
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'استخراج ملف',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff474747),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: _buildCustomDropdownMenu(
                      label: 'الملف',
                      selectedItem: selectedFormat,
                      items: ['CSV', 'Word', 'PDF'],
                      onSelected: (value) {
                        setState(() {
                          selectedFormat = value;
                          isDropdownOpen = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.print,
                        color: Colors.white,
                      ),
                      label: Text(
                        'طباعة',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 4.0,
                        ),
                        maximumSize: const Size(double.infinity, 36),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDropdownMenu({
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
        GestureDetector(
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
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
        ),
        if (isDropdownOpen)
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((String item) {
                IconData iconData;
                Color? color;
                switch (item) {
                  case 'CSV':
                    iconData = FontAwesomeIcons.solidFileExcel;
                    color = Colors.green;
                    break;
                  case 'Word':
                    iconData = FontAwesomeIcons.solidFileWord;
                    color = Colors.blue;
                    break;
                  case 'PDF':
                    iconData = FontAwesomeIcons.solidFilePdf;
                    color = Colors.red;
                    break;
                  default:
                    iconData = Icons.insert_drive_file;
                }

                return GestureDetector(
                  onTap: () {
                    onSelected(item);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Icon(
                          iconData,
                          size: 18.0,
                          color: color!,
                        ),
                        const SizedBox(width: 8.0),
                        Text(item),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
