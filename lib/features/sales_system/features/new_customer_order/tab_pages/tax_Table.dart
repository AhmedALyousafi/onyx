//جدول الضريبة
import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

class Tax_Table extends StatefulWidget {
  const Tax_Table({super.key});

  @override
  State<Tax_Table> createState() => _TaxScreenState();
}

class _TaxScreenState extends State<Tax_Table> {
  List<Map<String, dynamic>> taxs = [
    {
      "tax_names": "ضريبة قيمة",
      "tax_authority": "مصلحة الضرائب",
      "rate": "14.00",
      "amount": "1680.00",
      "isActive": true,
    },
    {
      "tax_names": "ضربية قيمة مضافة",
      "tax_authority": "مصلحة الضرائب2",
      "rate": "10.00",
      "amount": "780.00",
      "isActive": true,
    },
  ];

  List<Map<String, dynamic>> entries = [
    {
      "entry_number": "001-08673",
      "entry_name": "صنف توزيع جديد",
      "entry_type": "الصنف",
      "tax_number": 1,
      "tax_authority": "مصلحة الضرائب",
      "rate": "14.00",
      "amount": "840.00",
    },
    {
      "entry_number": "001-08673",
      "entry_name": "صنف توزيع جديد",
      "entry_type": "الصنف",
      "tax_number": 1,
      "tax_authority": "مصلحة الضرائب",
      "rate": "14.00",
      "amount": "840.00",
    },
    {
      "entry_number": "001-04173",
      "entry_name": "صنف توزيع جديد",
      "entry_type": "الصنف",
      "tax_number": 2,
      "tax_authority": "مصلحة الضرائب2",
      "rate": "10.00",
      "amount": "780.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: MediaQuery.of(context).size.width > 500
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'العرض حسب الضريبة و الجهة',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'ReadexPro',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text(
                        'العرض حسب نوع المدخل ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'ReadexPro',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          setState(() {});
                        },
                      ),
                    ],
                  )
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                checkboxTheme: CheckboxThemeData(
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  side: const BorderSide(
                                      color: Color(0xffe2e2e2), width: 0.5),
                                ),
                              ),
                              child: Checkbox(
                                value: true,
                                onChanged: (bool? value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              'العرض حسب الضريبة و الجهة',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'ReadexPro',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? value) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              'العرض حسب نوع المدخل ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'ReadexPro',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          _taxTable(),
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: const Padding(
              padding: EdgeInsets.only(
                  right: 30.0, left: 400, top: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    '2460',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'الاجمالي',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          _taxMovementTable(),
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: const Padding(
              padding: EdgeInsets.only(
                  right: 30.0, left: 80, top: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    '2460',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'الاجمالي',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _taxTable() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) =>  AppColors.blue,
                    ),
                    headingTextStyle: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.bold),
                    columns: const [
                      DataColumn(
                          label: Expanded(
                              child: Center(child: Text('رقم الضريبة')))),
                      DataColumn(
                          label: Expanded(
                              child: Center(child: Text('اسم الجهة')))),
                      DataColumn(
                          label:
                              Expanded(child: Center(child: Text('النسبة')))),
                      DataColumn(
                          label:
                              Expanded(child: Center(child: Text('المبلغ')))),
                      DataColumn(
                          label: Expanded(child: Center(child: Text('عرض')))),
                    ],
                    rows: taxs.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Center(child: Text(item['tax_names']))),
                          DataCell(Center(
                              child: Text(item['tax_authority'].toString()))),
                          DataCell(
                              Center(child: Text(item['rate'].toString()))),
                          DataCell(
                              Center(child: Text(item['amount'].toString()))),
                          DataCell(
                            Center(
                              child: Switch(
                                value: item['isActive'],
                                onChanged: (bool value) {
                                  setState(() {
                                    item['isActive'] = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList()),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _taxMovementTable() {
    List<Map<String, dynamic>> filteredTaxs = entries.where((entry) {
      var relatedTax = taxs.firstWhere(
          (tax) => tax['tax_authority'] == entry['tax_authority'],
          orElse: () => {});
      return relatedTax.isNotEmpty && relatedTax['isActive'] == true;
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) =>  AppColors.blue,
                ),
                headingTextStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.bold),
                columns: const [
                  DataColumn(
                      label:
                          Expanded(child: Center(child: Text('رقم المدخل')))),
                  DataColumn(
                      label:
                          Expanded(child: Center(child: Text('اسم المدخل')))),
                  DataColumn(
                      label:
                          Expanded(child: Center(child: Text('نوع المدخل')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('رقم الجهة')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('اسم الجهة')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('النسبة')))),
                  DataColumn(
                      label: Expanded(child: Center(child: Text('المبلغ')))),
                ],
                rows: filteredTaxs.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Center(child: Text(item['entry_number']))),
                      DataCell(Center(child: Text(item['entry_name']))),
                      DataCell(
                          Center(child: Text(item['entry_type'].toString()))),
                      DataCell(
                          Center(child: Text(item['tax_number'].toString()))),
                      DataCell(Center(
                          child: Text(item['tax_authority'].toString()))),
                      DataCell(Center(child: Text(item['rate'].toString()))),
                      DataCell(Center(child: Text(item['amount'].toString()))),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
