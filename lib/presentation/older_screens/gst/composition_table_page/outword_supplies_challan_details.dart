import 'package:flutter/material.dart';

import 'outward_supplies.dart';

class ChallanDetails extends StatefulWidget {
  const ChallanDetails({super.key});

  @override
  State<ChallanDetails> createState() => _ChallanDetailsState();
}

class _ChallanDetailsState extends State<ChallanDetails> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Challan Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const OutwardSupplies()));
                        }, child: const Text('challen'))),
                    const Expanded(
                        flex: 2,
                        child: Text('Print',
                            style: TextStyle(color: Colors.blue))),
                    const Expanded(
                        flex: 2,
                        child:
                        Text('Edit', style: TextStyle(color: Colors.blue))),
                    const Expanded(
                        flex: 3,
                        child: Text('Download Pdf',
                            style: TextStyle(color: Colors.blue))),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Table(
                  border: TableBorder.all(),
                  // columnWidths: {},
                  defaultColumnWidth: const FixedColumnWidth(150),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        children: const [
                          Text(
                            'SN',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Cr/Exp Date',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'CPIN',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'C.No.',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Deposit Date',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Period',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'IGIST',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'CGST',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'SGST',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Cess',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Mode',
                            style: TextStyle(fontSize: 14),
                          )
                        ]),
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        children: [
                          const Icon(Icons.search),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          // TextInput(controller: controller, hintText: '456'),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}