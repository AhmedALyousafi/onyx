import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
          child: Column(
            children: [
              // Header Row
              Container(
                color: const Color(0xFF0B75C9), // لون الهيدر
                child: Row(
                  children: [
                    _buildHeaderCell('رقم الحاوية'),
                    _buildHeaderCell('إجمالي الحاوية'),
                    _buildHeaderCell('إجمالي السعر'),
                  ],
                ),
              ),
              // Table Content
              _buildTableRow('-', '-', '-'),
              _buildTableRow1('-', '-', '-'),
              _buildTableRow('-', '-', '-'),
            ],
          ),
        ),
      ),
    );
  }

  // Method for building header cells
  Widget _buildHeaderCell(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // Method for building table rows
  Widget _buildTableRow(String col1, String col2, String col3) {
    return Container(
      child: Row(
        children: [
          _buildCell(col1),
          _buildCell(col2),
          _buildCell(col3),
        ],
      ),
    );
  }

  Widget _buildTableRow1(String col1, String col2, String col3) {
    return Container(
      color: Colors.grey[300],
      child: Row(
        children: [
          _buildCell(col1),
          _buildCell(col2),
          _buildCell(col3),
        ],
      ),
    );
  }

  // Method for building individual cells
  Widget _buildCell(String text) {
    return Expanded(
      child: Container(
        height: 50, // ارتفاع الصف
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
