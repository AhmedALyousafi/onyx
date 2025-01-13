import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

ListTile _createDrawerItem(IconData icon, String text) {
  return ListTile(
    title: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
    leading: Icon(icon, color: Colors.blue),
    onTap: () {
      // Add navigation logic here if necessary
    },
  );
}

class ExportFileDialog extends StatefulWidget {
  const ExportFileDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExportFileDialogState createState() => _ExportFileDialogState();
}

class _ExportFileDialogState extends State<ExportFileDialog> {
  String? selectedFormat;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16),
        titlePadding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: SizedBox(
          width: 603.53,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DropdownButtonFormField2<String>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                  ),
                  hint: const Text("اختر صيغة الملف"),
                  items: const [
                    DropdownMenuItem(
                      value: "CSV",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("CSV", textAlign: TextAlign.right),
                          Icon(Icons.file_download, color: Colors.green),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Word",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Word", textAlign: TextAlign.right),
                          Icon(Icons.file_download, color: Colors.blue),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: "PDF",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("PDF", textAlign: TextAlign.right),
                          Icon(Icons.file_download, color: Colors.red),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedFormat = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (selectedFormat != null) {
                    Navigator.pop(context, selectedFormat);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("يرجى اختيار صيغة الملف")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.save_alt, size: 20, color: Colors.white),
                    SizedBox(width: 8),
                    Text("إستخراج"),
                  ],
                ),
              ),
            ],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("استخراج ملف", style: TextStyle(fontSize: 20)),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget build(BuildContext context) {
  var isCollapsed;
  return Container(
    child: Text(isCollapsed ? 'Collapsed' : 'Expanded'),
  );
}
