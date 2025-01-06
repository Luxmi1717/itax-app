import 'dart:io';
import 'package:flutter/material.dart';
import 'package:itax/models/itr_manually_model.dart';
import 'package:itax/providers/manually_itr_form16.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:provider/provider.dart';



class JsonDownloadButton extends StatefulWidget {

  const JsonDownloadButton({super.key});

  @override
  State<JsonDownloadButton> createState() => _JsonDownloadButtonState();
}

class _JsonDownloadButtonState extends State<JsonDownloadButton> {
  @override
  Widget build(BuildContext context) {
    final itrManualy = Provider.of<ManualITRCalculation>(context);
    final itrManualyProfile = Provider.of<itrManuallyProfileSection>(context);
    final itrManuallTaxPaid = Provider.of<ManuallyITRTaxPaid>(context);
    final itrTDSNonSalary = Provider.of<itrManuallyTDSNonSalary>(context);
    final itrTDSonSalary = Provider.of<itrManuallyTDSonSalary>(context);
    final itrTCSDetail = Provider.of<ItrManuallyTCSDetails>(context);
    int ? TatolTexPaid=itrManuallTaxPaid.totalAdvanceTax+itrTDSonSalary.totalamount+itrTDSNonSalary.totalamount+itrManuallTaxPaid.totalSelfAssessmentTax+itrTCSDetail.totalamount;
    int ? TaxRefund=itrManualy.tax.toInt()-TatolTexPaid;
    int Refund=0;
    if(TaxRefund<0)
      {
        Refund=TaxRefund;
      }


    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueAccent,
      body:

          Center(
            child: ElevatedButton(
                  onPressed: () {
                    print(itrManuallTaxPaid.totalAdvanceTax.toString());
                    print(itrManuallTaxPaid.totalSelfAssessmentTax.toString());
                    print((itrTDSonSalary.totalamount+itrTDSNonSalary.totalamount).toString());
                    print('hell');
                    itrManuallyTDSonSalary instance = itrManuallyTDSonSalary();
                    int totalAmount = instance.totalamount;
                    print('no tds $totalAmount');


      ITR1Model itr1Model = ITR1Model(


          Form_ITR1: {
      "FormName": "ITR-1",
        "Description": "For Indls having Income from Salary, Pension, family pension and Interest",
          "AssessmentYear":itrManualyProfile.assessmentYear ,
          "SchemaVer": "Ver1.0",
          "FormVer": "Ver1.0"
        },



        PersonalInfo: {
          "AssesseeName": {
            "FirstName": itrManualyProfile.nameController.text,
            "MiddleName": itrManualyProfile.MiddleNameController.text,
            "SurNameOrOrgName": itrManualyProfile.SerNameController.text,
          },
          "PAN": itrManualyProfile.panNumberController.text,
          "Address": {
            "ResidenceNo": itrManualyProfile.flatNoController.text,
            "ResidenceName": '${itrManualyProfile.BuilddingNoController.text}${itrManualyProfile.BuildingNameController.text}',
            "RoadOrStreet": itrManualyProfile.StreetController.text,
            "LocalityOrArea": itrManualyProfile.areaController.text,
            "CityOrTownOrDistrict": '${itrManualyProfile.cityController.text}${itrManualyProfile.districtController.text}',
            "StateCode": itrManualyProfile.SelectedState,
            "CountryCode": itrManualyProfile.countryCode,
            "PinCode": itrManualyProfile.PancodeController.text,
            "CountryCodeMobile": 91,
            "MobileNo": itrManualyProfile.phoneNumberController.text,
            "EmailAddress": itrManualyProfile.gmailController.text,
          },
          "DOB": itrManualyProfile.dobController.text,
          "EmployerCategory": itrManualyProfile.employeStatus,
          "AadhaarCardNo": itrManualyProfile.adharCardController.text,
        },
        FilingStatus: {
          "ReturnFileSec": 11,
          "NewTaxRegime": "N",
          "SeventhProvisio139": "N"
          // Add more key-value pairs as needed
        },
        ITR1_IncomeDeductions: {
          "GrossSalary": itrManualy.salary,
          "Salary": itrManualy.salary,
          "PerquisitesValue": 0,
          "ProfitsInSalary": 0,
          "AllwncExemptUs10": {
            "TotalAllwncExemptUs10": 0
          },
          "NetSalary": itrManualy.salary,
          "DeductionUs16": 0,
          "DeductionUs16ia": 0,
          "EntertainmentAlw16ii": 0,
          "ProfessionalTaxUs16iii": 0,
          "IncomeFromSal": itrManualy.salary,
          "GrossRentReceived": 0,
          "TaxPaidlocalAuth": 0,
          "AnnualValue": 0,
          "StandardDeduction": 0,
          "InterestPayable": 0,
          "ArrearsUnrealizedRentRcvd": 0,
          "TotalIncomeOfHP": 0,
          "IncomeOthSrc": itrManualy.totalinterest,
          "OthersInc": {
            "OthersIncDtlsOthSrc": [
              {
                "OthSrcNatureDesc": "OTH",
                "OthSrcOthNatOfInc": "Other Item",
                "OthSrcOthAmount": itrManualy.otherSource.text,
              }
            ]
          },
          "DeductionUs57iia": 0,
          "GrossTotIncome": 280000,
          "UsrDeductUndChapVIA": {
            "Section80C":itrManualy.total80C,
            "Section80CCC": 0,
            "Section80CCDEmployeeOrSE": 0,
            "Section80CCD1B": itrManualy.CCD80,
            "Section80CCDEmployer": itrManualy.cCD80,
            "Section80D": 0,
            "Section80DD": itrManualy.totaldd80,
            "Section80DDB": itrManualy.deductionAmount,
            "Section80E": itrManualy.E80,
            "Section80EE": itrManualy.section24,
            "Section80EEA": itrManualy.EEA80,
            "Section80EEB": itrManualy.EEB80,
            "Section80G": itrManualy.G80,
            "Section80GG":itrManualy.g100,
            "Section80GGA": itrManualy.GGA100,
            "Section80GGC": itrManualy.GGC100,
            "Section80U": itrManualy.u80,
            "Section80TTA": itrManualy.TTA80,
            "Section80TTB": itrManualy.TTB80,
            "TotalChapVIADeductions": 0
          },
          "DeductUndChapVIA": {
            "Section80C": itrManualy.total80C,
            "Section80CCC": 0,
            "Section80CCDEmployeeOrSE": 0,
            "Section80CCD1B": itrManualy.CCD80,
            "Section80CCDEmployer": itrManualy.cCD80,
            "Section80D": 0,
            "Section80DD": itrManualy.totaldd80,
            "Section80DDB": itrManualy.deductionAmount,
            "Section80E": itrManualy.E80,
            "Section80EE": itrManualy.section24,
            "Section80EEA": itrManualy.EEA80,
            "Section80EEB": itrManualy.EEB80,
            "Section80G": itrManualy.G80,
            "Section80GG":itrManualy.g100,
            "Section80GGA": itrManualy.GGA100,
            "Section80GGC": itrManualy.GGC100,
            "Section80U": itrManualy.u80,
            "Section80TTA": itrManualy.TTA80,
            "Section80TTB": itrManualy.TTB80,
            "TotalChapVIADeductions": 0
          },
          "TotalIncome": itrManualy.netamount,
          "ExemptIncAgriOthUs10": {
            "ExemptIncAgriOthUs10Total": 0
          },
          "IncomeNotified89A": 0,
          "IncomeNotifiedOther89A": 0,
          "Increliefus89A": 0,
          "Increliefus89AOS": 0
        },
        ITR1_TaxComputation: {
          "TotalTaxPayable": itrManualy.Totaltax1,
          "Rebate87A": 0,
          "TaxPayableOnRebate": 0,
          "EducationCess": 0,
          "GrossTaxLiability": 0,
          "Section89": 0,
          "NetTaxLiability": 0,
          "TotalIntrstPay": 0,
          "IntrstPay": {
            "IntrstPayUs234A": 0,
            "IntrstPayUs234B": 0,
            "IntrstPayUs234C": 0,
            "LateFilingFee234F": 0
          },
          "TotTaxPlusIntrstPay": 0
        },
          TDSonOthThanSals:{
            "TDSonOthThanSal":itrTDSNonSalary.convertDataListToJson(),
            "TotalTDSonOthThanSals": itrTDSNonSalary.totalamount.toString(),
          },




        TaxPayments: {
          "TaxPayment": itrManuallTaxPaid.convertDataListToJson(),
          "TotalTaxPayments": itrManuallTaxPaid.totalamount.toString(),
        },


          TaxPaid: {
      "TaxesPaid": {
      "AdvanceTax": itrManuallTaxPaid.totalAdvanceTax.toString(),
      "TDS": (itrTDSonSalary.totalamount+itrTDSNonSalary.totalamount).toString(),
      "TCS": itrTCSDetail.TCSTaxDeducted.text,
      "SelfAssessmentTax": itrManuallTaxPaid.totalSelfAssessmentTax.toString(),
      "TotalTaxesPaid": (itrManuallTaxPaid.totalAdvanceTax+itrTDSonSalary.totalamount+itrTDSNonSalary.totalamount+itrManuallTaxPaid.totalSelfAssessmentTax).toString()+itrTCSDetail.TCSTaxDeducted.text,
      },
      "BalTaxPayable":itrManualy.tax.toString(),
      },

          Refund: {
          "RefundDue": Refund.abs().toString(),
          "BankAccountDtls": {
            "AddtnlBankDetails": [
              {
              "IFSCCode":itrManualyProfile.IfscCodeController.text ,
              "BankName": itrManualyProfile.BankNameController.text,
              "BankAccountNo": itrManualyProfile.BankNameController.text,
              "UseForRefund": "true"
            },
              ],

          },
        },


          Schedule80G: {
      "TotalDonationsUs80GCash": 0,
      "TotalDonationsUs80GOtherMode": 0,
      "TotalDonationsUs80G": 0,
      "TotalEligibleDonationsUs80G": 0
      },
          Schedule80D: {
          "Sec80DSelfFamSrCtznHealth": {
            "SeniorCitizenFlag": "S",
            "SelfAndFamily": 0,
            "HealthInsPremSlfFam": 0,
            "PrevHlthChckUpSlfFam": 0,
            "SelfAndFamilySeniorCitizen": 0,
            "HlthInsPremSlfFamSrCtzn": 0,
            "PrevHlthChckUpSlfFamSrCtzn": 0,
            "MedicalExpSlfFamSrCtzn": 0,
            "ParentsSeniorCitizenFlag": "P",
            "Parents": 0,
            "HlthInsPremParents": 0,
            "PrevHlthChckUpParents": 0,
            "ParentsSeniorCitizen": 0,
            "HlthInsPremParentsSrCtzn": 0,
            "PrevHlthChckUpParentsSrCtzn": 0,
            "MedicalExpParentsSrCtzn": 0,
            "EligibleAmountOfDedn": 0
          }
        },

          TDSonSalaries: {
          "TDSonSalary": itrTDSonSalary.convertDataListToJson(),
          "TotalTDSonSalaries": itrTDSonSalary.totalamount.toString(),
          },


          Verification: {
          "Declaration":
          {
                "AssesseeVerName" :itrManualyProfile.nameController.text,
                "FatherName": itrManualyProfile.fatherNameController.text,
                  "AssesseeVerPAN": itrManualyProfile.panNumberController.text,
          },
             "Capacity": "S",
              "Place": itrManualyProfile.cityController.text,}




      );

      String jsonStr = convertITR1ModelToJson(itr1Model);
      print(jsonStr);

      _downloadJsonFile(context,jsonStr);
                  },


                  child: const Text('Download JSON'),


      ),
          ),
    );
  }




  Future<void> requestPermission() async {
    // Request storage permission
    final status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Storage permission not granted');
    }
  }

  Future<void> _downloadJsonFile(BuildContext context, String jsonStr, ) async {
    // Convert the JSON object to a string
print(jsonStr);

     await requestPermission();
    // Get the directory where the file will be saved
//final directory = (await getExternalStorageDirectories(type: StorageDirectory.downloads))?.first;
//final directory = await getApplicationDocumentsDirectory();
//Directory dir = Directory('/storage/emulated/0/Downloads');
    final downloadsDir = await getExternalStorageDirectory();
var savePath = downloadsDir?.path;
final file = File("$savePath/mydata.json");
    try {
      // Write the JSON data to the file

      await file.writeAsString(jsonStr);

      print('JSON file saved in Downloads folder');
    } catch (e) {
      print('Error saving JSON file: $e');
    }


    // Show a download confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Download complete'),
        content: Text('The file has been saved to $savePath'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}