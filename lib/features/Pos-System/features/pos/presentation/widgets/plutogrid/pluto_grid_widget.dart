import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onyx/core/theme/app_colors.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PlutoGridWidget extends StatefulWidget {
  const PlutoGridWidget({super.key, this.showrow = true});

  final bool showrow;

  @override
  State<PlutoGridWidget> createState() => _PlutoGridWidgetState();
}

class _PlutoGridWidgetState extends State<PlutoGridWidget> {
  late List<PlutoColumn> columns;
  late List<PlutoRow> rows;

  final List<PlutoColumn> columns1 = [];

  late List<PlutoRow> rows1;
  PlutoGridStateManager? stateManager;
  int? hoveredIndex;

  List<Map<String, dynamic>> items = [
    {
      "product_name": "Samsung S 22 32-3555",
      "unit": "عدد",
      "pack": 1,
      "numeric_unit": 1,
      "value": 234,
      "group": "أجهزة الكترونية",
      "product_type": "35",
      "expiry_date": "21/5/2024",
      "height": "2",
      "width": "2",
      "free_quantity": "2",
      "additional_free_quantity": "1",
      "promotional_discount_precentage": "5",
      "promotional_discount": "480",
      "quantity_required": "2",
      "available_quantity": "50",
      "price": "4000",
      "selected": false,
    },
    {
      "product_name": "Samsung S 22 32-3554",
      "unit": "عدد",
      "pack": 1,
      "numeric_unit": 1,
      "value": 53,
      "group": "أجهزة الكترونية",
      "product_type": "35",
      "expiry_date": "21/5/2024",
      "height": "1",
      "width": "52",
      "free_quantity": "2",
      "additional_free_quantity": "1",
      "promotional_discount_precentage": "5",
      "promotional_discount": "480",
      "quantity_required": "2",
      "available_quantity": "20",
      "price": "4000",
      "selected": false,
    },
    {
      "product_name": "Samsung S 22 32-3553",
      "unit": "عدد",
      "pack": 1,
      "numeric_unit": 1,
      "value": 234,
      "group": "أجهزة الكترونية",
      "product_type": "35",
      "expiry_date": "21/5/2024",
      "height": "2",
      "width": "254",
      "free_quantity": "2",
      "additional_free_quantity": "1",
      "promotional_discount_precentage": "5",
      "promotional_discount": "480",
      "quantity_required": "2",
      "available_quantity": "30",
      "price": "4000",
      "selected": false,
    },
  ];

  int currentRowIndex = 0;

  @override
  void initState() {
    super.initState();

    columns = [
      PlutoColumn(
        title: 'ص',
        field: 'selected',
        type: PlutoColumnType.text(),
        backgroundColor:  AppColors.blue,
        enableRowDrag: true,
        enableColumnDrag: true,
        enableRowChecked: true,
        frozen: PlutoColumnFrozen.start,
        width: 60,
        textAlign: PlutoColumnTextAlign.center,
        cellPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        filterPadding: EdgeInsets.zero,
        suppressedAutoSize: true,
        enableDropToResize: false,
        enableSorting: false,
        enableHideColumnMenuItem: false,
        enableContextMenu: false,
        enableFilterMenuItem: false,
        enableSetColumnsMenuItem: false,
      ),
      PlutoColumn(
        title: 'اسم الصنف ',
        field: 'unit',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
      PlutoColumn(
        title: 'الوحدة',
        field: 'product_name',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
        enableSorting: true,
        renderer: (rendererContext) {
          int currentIndex = rendererContext.rowIdx;
          return MouseRegion(
            onEnter: (_) => setState(() => hoveredIndex = currentIndex),
            onExit: (_) => setState(() => hoveredIndex = null),
            child: GestureDetector(
              onTap: () {
                // openGridPopup(context);
              },
              child: Text(
                rendererContext.row.cells['product_name']!.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: hoveredIndex == currentIndex
                      ?  AppColors.blue
                      : Colors.black,
                  decoration: hoveredIndex == currentIndex
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
          );
        },
      ),
      PlutoColumn(
        title: 'الكمية',
        field: 'pack',
        type: PlutoColumnType.number(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
      PlutoColumn(
        title: 'السعر ',
        field: 'numeric_unit',
        type: PlutoColumnType.number(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
      PlutoColumn(
        title: 'ك.م/ سياسة',
        field: 'value',
        type: PlutoColumnType.number(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
      PlutoColumn(
        title: 'ك.م/ ترويجي',
        field: 'group',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
      PlutoColumn(
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        enableColumnDrag: false,
        enableSetColumnsMenuItem: false,
        enableAutoEditing: false,
        enableSorting: false,
        title: '',
        titleSpan: const TextSpan(children: [
          WidgetSpan(
              child: Icon(
            Icons.more_vert,
            color: Colors.white,
          ))
        ]),
        field: 'actions',
        type: PlutoColumnType.text(),
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF094F90),
        frozen: PlutoColumnFrozen.end,
        width: 40,
        renderer: (rendererContext) {
          return IconButton(
            icon: const Icon(
              FontAwesomeIcons.trashCan,
              color: Color(0xFF819AA7),
              size: 15,
            ),
            onPressed: () {
              setState(() {
                rows.remove(rendererContext.row);
              });
            },
          );
        },
      ),
      PlutoColumn(
        title: 'الخصم% ',
        field: 'product_type',
        type: PlutoColumnType.number(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
      PlutoColumn(
        title: 'خ/ ترويجي%',
        field: 'expiry_date',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
      PlutoColumn(
        title: 'الضريبة%',
        field: 'expiry',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor:  AppColors.blue,
      ),
    ];

    rows = List.generate(
      5,
      (index) => PlutoRow(
        cells: {
          'selected': PlutoCell(value: ''),
          'product_name': PlutoCell(value: ''),
          'unit': PlutoCell(value: ''),
          'pack': PlutoCell(value: 0),
          'numeric_unit': PlutoCell(value: ''),
          'value': PlutoCell(value: 0),
          'group': PlutoCell(value: ''),
          'product_type': PlutoCell(value: ''),
          'expiry_date': PlutoCell(value: ''),
          'actions': PlutoCell(value: 'Delete'),
          'expiry': PlutoCell(value: 'Delete'),
        },
      ),
    );

    // columns1.addAll([
    //   PlutoColumn(
    //     title: 'اسم المنتج',
    //     field: 'product_name',
    //     type: PlutoColumnType.text(),
    //   ),
    //   PlutoColumn(
    //     title: 'الكمية',
    //     field: 'available_quantity',
    //     type: PlutoColumnType.text(),
    //   ),
    //   PlutoColumn(
    //     title: 'السعر',
    //     field: 'price',
    //     type: PlutoColumnType.text(),
    //   ),
    // ]);
  }

  // void openGridPopup(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Directionality(
  //         textDirection: TextDirection.rtl,
  //         child: Dialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Container(
  //             width: 630,
  //             height: 400,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.all(16.0),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       const Text(
  //                         'اختيار المنتج',
  //                         style: TextStyle(
  //                             fontSize: 16,
  //                             fontFamily: 'ReadexPro',
  //                             fontWeight: FontWeight.w500,
  //                             color: Color(0xFF474747)),
  //                       ),
  //                       InkWell(
  //                         hoverColor: Colors.transparent,
  //                         splashColor: Colors.transparent,
  //                         highlightColor: Colors.transparent,
  //                         onTap: () => Navigator.of(context).pop(),
  //                         child: Container(
  //                           padding: const EdgeInsets.all(10),
  //                           decoration: const BoxDecoration(
  //                             color: Color(0xFFF2F2F2),
  //                             shape: BoxShape.circle,
  //                           ),
  //                           child: const Icon(
  //                             FontAwesomeIcons.x,
  //                             color: Color(0xFF819AA7),
  //                             size: 12,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(16.0),
  //                     child: PlutoGrid(
  //                       columns: columns1,
  //                       rows: items
  //                           .map((item) => PlutoRow(
  //                                 cells: {
  //                                   'product_name':
  //                                       PlutoCell(value: item['product_name']),
  //                                   'available_quantity': PlutoCell(
  //                                       value: item['available_quantity']),
  //                                   'price': PlutoCell(value: item['price']),
  //                                 },
  //                               ))
  //                           .toList(),
  //                       mode: PlutoGridMode.select,
  //                       onLoaded: (PlutoGridOnLoadedEvent event) {
  //                         event.stateManager.setShowColumnFilter(true);
  //                       },
  //                       onSelected: (PlutoGridOnSelectedEvent event) {
  //                         if (event.row != null &&
  //                             event.row!.cells['product_name'] != null) {
  //                           String selectedProductName = event
  //                               .row!.cells['product_name']!.value
  //                               .toString();
  //                           _populateRowData(
  //                               selectedProductName, event.rowIdx!);

  //                           Navigator.of(context).pop();
  //                         } else {
  //                           // Handle the scenario where the product name is not available
  //                           print(
  //                               'Selected row does not contain a valid product name.');
  //                         }
  //                       },
  //                       configuration: const PlutoGridConfiguration(
  //                           style: PlutoGridStyleConfig(
  //                               gridBackgroundColor: Colors.white)),
  //                       onSorted: (PlutoGridOnSortedEvent event) {
  //                         print(event);
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void _populateRowData(String productNumber, int rowInx) {
    if (currentRowIndex >= rows.length) {
      print("No more rows available for new products");
      return;
    }
    final product = items.firstWhere(
      (item) => item['product_name'] == productNumber,
      orElse: () => {},
    );

    if (product.isNotEmpty) {
      setState(() {
        rows[currentRowIndex].cells['product_name']!.value =
            product['product_name']; // Update product name
        rows[currentRowIndex].cells['unit']!.value = product['unit'];
        rows[currentRowIndex].cells['pack']!.value = product['pack'];
        rows[currentRowIndex].cells['numeric_unit']!.value =
            product['numeric_unit'];
        rows[currentRowIndex].cells['value']!.value = product['value'];
        rows[currentRowIndex].cells['group']!.value = product['group'];
        rows[currentRowIndex].cells['product_type']!.value =
            product['product_type'];
        rows[currentRowIndex].cells['expiry_date']!.value =
            product['expiry_date'];
        rows[currentRowIndex].cells['analytical_section']!.value =
            product['analytical_section'];
        rows[currentRowIndex].cells['analytical_section1']!.value =
            product['analytical_section1'];
        rows[currentRowIndex].cells['analytical_section2']!.value =
            product['analytical_section2'];
        rows[currentRowIndex].cells['analytical_section3']!.value =
            product['analytical_section3'];
        rows[currentRowIndex].cells['analytical_section4']!.value =
            product['analytical_section4'];
        rows[currentRowIndex].cells['analytical_section_description']!.value =
            product['analytical_section_description'];
        rows[currentRowIndex].cells['height']!.value = product['height'];
        rows[currentRowIndex].cells['width']!.value = product['width'];
        rows[currentRowIndex].cells['free_quantity']!.value =
            product['free_quantity'];
        rows[currentRowIndex].cells['additional_free_quantity']!.value =
            product['additional_free_quantity'];
        rows[currentRowIndex].cells['promotional_discount_precentage']!.value =
            product['promotional_discount_precentage'];
        rows[currentRowIndex].cells['promotional_discount']!.value =
            product['promotional_discount'];
        rows[currentRowIndex].cells['quantity_required']!.value =
            product['quantity_required'];
        rows[currentRowIndex].cells['available_quantity']!.value =
            product['available_quantity'];
        rows[currentRowIndex].cells['price']!.value = product['price'];

        currentRowIndex++;
      });

      stateManager!.setCurrentCell(
        rows[rowInx].cells['available_quantity'],
        rowInx,
        notify: true,
      );
      stateManager!.setEditing(true);

      // Notify the grid manager that the cell data has changed
      stateManager!.notifyListeners();
    } else {
      print("Product not found: $productNumber");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              )),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: PlutoGrid(
                  columns: columns,
                  rows: rows,
                  onChanged: (PlutoGridOnChangedEvent event) {
                    setState(() {
                      // When product number changes, update other fields
                      if (event.column.field == 'product_name') {
                        _populateRowData(event.value.toString(), event.rowIdx);
                      }
                    });
                  },
                  onLoaded: (PlutoGridOnLoadedEvent event) {
                    stateManager = event.stateManager; // Save the state manager
                  },
                  configuration: const PlutoGridConfiguration(
                    scrollbar: PlutoGridScrollbarConfig(
                      scrollBarColor: Color(0xFF319626),
                      isAlwaysShown: true,
                      scrollbarThickness: 8,
                      scrollbarThicknessWhileDragging: 10,
                    ),
                    style: PlutoGridStyleConfig(
                      gridBorderColor: Colors.transparent,
                      gridBorderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      cellTextStyle: TextStyle(
                        color: Color(0xFF474747),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'ReadexPro',
                        fontSize: 12,
                      ),
                      oddRowColor: Colors.white,
                      evenRowColor: Color(0xFFF9F9F9),
                      columnTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'ReadexPro',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
