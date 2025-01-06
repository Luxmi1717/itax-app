



/*class TaxesPaid extends StatefulWidget {
  final Map<String, dynamic> taxInfo;
  const TaxesPaid({Key? key, required this.taxInfo}) : super(key: key);

  @override
  State<TaxesPaid> createState() => _TaxesPaidState();
}

class _TaxesPaidState extends State<TaxesPaid> {
  TextEditingController text=TextEditingController();
  final List<String> items = [
    'Select Value',
    '194',
    '194A',
    '194C',
    '194ND',

  ];
  final List<String> Salary = [
    'Select Value',
    'Other Source',
    'Bussiness',
    'Other Source',
    'Cepital Gain',
    'Exempt Income',
    '194 N ',

  ];
  String? selectedValue='Select Value';
  String? NonSalary='Select Value';

  bool _isExpanded = false;

  List<Column> textFields = [];

  List<String> name=[
    'BSRCode',
    'Bank Name',
    'Date',
    'Challan Sr.No',
    'Tax'
  ];
  int count=1;

  void addTextFields() {
    setState(() {
      for (int i = 0; i <name.length; i++) {
        textFields.add(
          Column(

              mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),

              SizedBox(height: 10,),
              Text(name[i],

                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              InputTaxt(onChanged: (text ) {


              }, controller: text,),
            ],
          ),
        );
      }
    });
  }









  @override

  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(
        title: Text('ITR'),
        elevation: 0,
      ),
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ManuallyITRTaxPaid>(builder: (BuildContext context, pro, child) {
                List<Map<String, String>> taxPaidRecords = pro.taxPaidRecords;

                return ExpansionTile(
                  backgroundColor: Colors.grey.shade200,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Advance & Assessment Tax',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),

                        ],
                      ),
                      Text('',

                      )
                    ],
                  ),


                  initiallyExpanded: false,

                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: taxPaidRecords.length,
                      itemBuilder: (context, index) {
                        Map<String, String> taxPaidRecord = taxPaidRecords[index];

                        return Column(
                          children: [
                            TextField(
                              onChanged: (value) {
                                pro.updateTaxPaidField(
                                  index,
                                  'field1',
                                  value,
                                );
                              },
                              decoration: InputDecoration(
                                labelText: 'Field 1',
                              ),
                            ),
                            TextField(
                              onChanged: (value) {
                                pro.updateTaxPaidField(
                                  index,
                                  'field2',
                                  value,
                                );
                              },
                              decoration: InputDecoration(
                                labelText: 'Field 2',
                              ),
                            ),

                            // Add more text fields as needed
                          ],
                        );
                      },
                    ),


                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.0),
                          Text('BSRCode',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          Row(
                            children: [
                              InputTaxt(
                                onChanged: (value ) {
                                pro.setbsrCode();

                                }, controller: pro.textBSRcode,hintText: '0004329',errorcode: pro.isBSRCodeValid==false? 'please enter in valide BSDCode':null,keyboardType: TextInputType.number, ),
                              SizedBox(width: 5,),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text('Bank Name',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          InputTaxt(onChanged: (text ) {
                            pro.setbankName();


                            },controller: pro.textBankName,hintText: 'Axis Bank',errorcode: pro.isBankNamevalibation==false? 'please enter in Name':null, ),
                          SizedBox(height: 10.0),
                          Text('Date',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          InputTaxt(onChanged: (text ) {


                          },controller: pro.textDate, ),
                          SizedBox(height: 10.0),
                          Text('Challan Sr.No',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          InputTaxt(onChanged: (text ) {


                          }, controller: pro.textChallanSr,),
                          SizedBox(height: 10.0),
                          Text('Tax',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          InputTaxt(onChanged: (text ) {



                          }, controller: pro.texttax,),
                          Column(
                            children: [
                              Column(
                                children:textFields,
                              ),
                              ElevatedButton(onPressed: (){
                                setState(() {
                                  count++;
                                  textFields.clear();
                                });


                              }, child: Text('delete'))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(onPressed: addTextFields,
                              child:Icon(Icons.add) ,),
                            ],
                          ),
                        ],
                      ),

                    ),

                    ElevatedButton(
                      onPressed: () {

                        pro.addTaxPaidRecord();
                      },
                      child: Text('Add Field'),
                    ),
                  ],
                );}),
              Consumer<ManuallyITRTaxPaid>(builder: (BuildContext context, pro, child) {
                return ExpansionTile(
                  backgroundColor: Colors.grey.shade200,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TDS Details',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),

                        ],
                      ),
                      Text('',

                      )
                    ],
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            width: MediaQuery.of(context).size.width*0.6,
                            child: CustomDropdownButton2(
                              hint: 'Select',
                              dropdownItems: items,
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),

                          SizedBox(height: 15.0),




                          Text('Tan Number',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller:pro.TDSTanNumber,),
                          SizedBox(height: 10.0),
                          Text('Name of Employer',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: pro.TDSEmployer, ),
                          SizedBox(height: 10.0),
                          Text('Income chargeable under the head salaries',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: pro.TDSIncomeChargeable,),
                          SizedBox(height: 10.0),
                          Text('Total Tax deducted ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller:pro.TDSTotalTaxdeducted,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(onPressed: (){},child:Icon(Icons.add) ,),
                            ],
                          ),




                        ],
                      ),

                    ),
                  ],
                );}),
              Consumer<ManuallyITRTaxPaid>(builder: (BuildContext context, pro, child) {
                return ExpansionTile(
                  backgroundColor: Colors.grey.shade200,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TCS',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),

                        ],
                      ),
                      Text('',

                      )
                    ],
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [



                          SizedBox(height: 5.0),
                          Text('Tan Number',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: pro.TCSTanNumber, ),
                          SizedBox(height: 10.0),
                          Text('Name of Deducted',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: pro.TCSDeducted, ),
                          SizedBox(height: 10.0),
                          Text('Purcheses of assets',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: pro.TCSPurchesesAssets,),
                          SizedBox(height: 10.0),
                          Text('Total Tax deducted ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: text, ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(onPressed: (){},child:Icon(Icons.add) ,),
                            ],
                          ),




                        ],
                      ),

                    ),
                  ],
                );}),
              Consumer<ManuallyITRTaxPaid>(builder: (BuildContext context, pro, child) {
                return ExpansionTile(
                  backgroundColor: Colors.grey.shade200,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(

                        children: [
                          Text('Non Salary',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),

                        ],
                      ),
                      Text('',

                      )
                    ],
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(

                            width: MediaQuery.of(context).size.width*0.6,
                            child: CustomDropdownButton2(
                              hint: 'Select',
                              dropdownItems: items,
                              value:selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),

                          SizedBox(height: 5.0),
                          Text('Head of Income(1)',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Section(2)',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Tan/Pan',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: text, ),
                          SizedBox(height: 10.0),
                          Text('Name ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: text, ),
                          SizedBox(height: 10.0),
                          Text('Name ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Amount Paid/Credited Income offered ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),

                          SizedBox(height: 10.0),
                          Text('Data of Payment/credited ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Tax Deduction inclu.surcharge/edu.cess ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Amount Paid/Credited Income offered ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: text, ),

                          SizedBox(height: 10.0),
                          Text('Unique Certificate Number(optional) ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),


                          SizedBox(height: 10.0),
                          Text('Unique Certificate Nuber (optional) 9',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),

                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),

                          SizedBox(height: 10.0),
                          Text('F.Y. in which TDS is Deducted (Optional) ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Amount out of in (7) to be allowed as credit ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: text, ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(onPressed: (){},child:Icon(Icons.add) ,),
                            ],
                          ),





                        ],
                      ),

                    ),
                  ],
                );}),
              Consumer<ManuallyITRTaxPaid>(builder: (BuildContext context, pro, child) {
                return ExpansionTile(
                  backgroundColor: Colors.grey.shade200,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Salary',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),

                        ],
                      ),
                      Text('',

                      )
                    ],
                  ),


                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.0),
                          Text('Tan Number',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Name of Deducted',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          }, controller: text,),
                          SizedBox(height: 10.0),
                          Text('Income chargeable under the head salaries',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text ) {


                          },controller: text, ),
                          SizedBox(height: 10.0),
                          Text('Total Tax deducted ',

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          InputTaxt(onChanged: (text) {


                          },controller: text, ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(onPressed: (){

                              },child:Icon(Icons.add) ,),
                            ],
                          ),




                        ],
                      ),

                    ),
                  ],
                );
              }),
             /* ListView(
                children: _textFields.map((textField) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter text',
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController(text: textField),
                    ),
                  );
                }).toList(),
              ),*/

            ],
          )

        ),
      ),
    );
  }
}*/


