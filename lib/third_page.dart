import 'package:flutter/material.dart';

class Thirdpage extends StatelessWidget {
  Thirdpage(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('企業理念'),
      ),
        body: DataTable(
          columns: [
            DataColumn(
              label: Text('部署'),
            ),
            DataColumn(
              label: Text('電話番号'),
            ),
            DataColumn(
              label: Text('担当箇所'),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(Text('経営')),
                DataCell(Text('03-3453-1181')),
                DataCell(Text('ＩＲ情報')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('営業')),
                DataCell(Text('03-3453-1181')),
                DataCell(Text('サービス')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('人事')),
                DataCell(Text('03-3453-1181')),
                DataCell(Text('その他')),
              ],
            ),
          ],
        ),

    );

  }

}