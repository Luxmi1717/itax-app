import 'package:flutter/material.dart';

class MyDataTable extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const MyDataTable({super.key, required this.data});

  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  bool _showSidebar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
        onTap: () {
          setState(() {
            _showSidebar = !_showSidebar;
          });
        },
        child: Stack(
          children: [
            DataTable(
              columns: const [
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Age'),
                ),
                DataColumn(
                  label: Text('Email'),
                ),
              ],
              rows: widget.data.map((e) => DataRow(
                cells: [
                  DataCell(Text(e['name'])),
                  DataCell(Text(e['age'].toString())),
                  DataCell(Text(e['email'])),
                ],
              )).toList(),
            ),
            if (_showSidebar) Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                color: Colors.blueGrey[100],
                width: 40,
                child: const Column(
                  children: [
                    Text('colom'),
                    Text('colom'),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
