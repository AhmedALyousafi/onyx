import 'package:flutter/material.dart';

class TotalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue),
        ),
        child: Column(
          children: [
            _buildHeader(context),
            Divider(),
            _buildRow(context, 'إجمالي السعر', 'الخصم', 'إجمالي الضريبة',
                'خصم الأصناف'),
            _buildRow(context, 'إجمالي الكمية', 'خصم تجميعي', 'إجمالي الربح',
                'خصم الأصناف'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'إخفاء الإجمالي',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: Icon(Icons.visibility_off, color: Colors.white),
            onPressed: () {
              // Add functionality to hide totals
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label1, String label2,
      String label3, String label4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTotalField(label1),
        _buildTotalField(label2),
        _buildTotalField(label3),
        _buildTotalField(label4),
      ],
    );
  }

  Widget _buildTotalField(String label) {
    return Expanded(
      child: Column(
        children: [
          TextFormField(
            initialValue: '0.00',
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
