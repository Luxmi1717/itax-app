

import 'package:flutter/material.dart';
import 'package:itax/providers/providers_old/gstr1_json_pro.dart';
import 'package:provider/provider.dart';


class MyDataList extends StatelessWidget {


  const MyDataList({super.key,});

  @override
  Widget build(BuildContext context) {
    final gstr1 = Provider.of<MyDataModel>(context, listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: gstr1.myData!.b2b.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final b2bData = gstr1.myData!.b2b[index];
                List<MyDataRow> dataRows = b2bData.inv.map((invData) =>
                    MyDataRow(inum: invData.inum)).toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('B2B Data ${index + 1}'),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('INUM')),
                            ],
                            rows: dataRows.map((dataRow) {
                              return DataRow(cells: [
                                DataCell(Text(dataRow.inum)),
                              ]);
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Do something when the button is pressed
                          },
                          child: const Text('Button'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: const Center(
              child: Text('Additional Widget'),
            ),
          ),
        ],
      ),
    );
  }

}
  class MyDataRow {
    final String inum;

    MyDataRow({required this.inum});
  }


