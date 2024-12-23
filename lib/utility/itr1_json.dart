
import 'package:itax/models/address_model.dart';

Map<String, dynamic> getNameParts(String fullName) {
  List<String> parts = fullName.split(' ');
  String firstName = parts[0];
  String middleName = parts.length > 1 ? parts[1] : '';
  String lastName = parts.length > 2 ? parts[2] : '';

  return {
    'firstName': firstName,
    'middleName': middleName,
    'lastName': lastName,
  };
}

Map<String, dynamic> extractAddressInfo(String line) {
  final Map<String, dynamic> addressInfo = {
    'ResidenceNo': '',
    'ResidenceName': '',
    'RoadOrStreet': '',
    'LocalityOrArea': '',
    'CityOrTownOrDistrict': '',
    'StateCode': '',
    'CountryCode': '',
    'PinCode': '',
    'CountryCodeMobile': '',
    'MobileNo': '',
    'EmailAddress': '',
  };

  final List<String> lines = line.split('\n');
  final int lineCount = lines.length;

  // Extract name
  addressInfo['ResidenceName'] = lines[0].trim();

  // Extract address
  String address = '';
  int addressStartIndex = 1;

  // Check if the line after the name starts with 'C/O'
  if (lineCount > 1 && lines[1].trim().startsWith('C/O')) {
    addressStartIndex = 2;
    addressInfo['ResidenceNo'] = lines[1].trim().substring(3).trim();
  }

  for (int i = addressStartIndex; i < lineCount; i++) {
    address += '${lines[i].trim()} ';
  }

  final List<String> addressParts = address.split(',');

  if (addressParts.isNotEmpty) {
    addressInfo['RoadOrStreet'] = addressParts[0].trim();
  }
  if (addressParts.length >= 2) {
    addressInfo['LocalityOrArea'] = addressParts[1].trim();
  }
  if (addressParts.length >= 3) {
    addressInfo['CityOrTownOrDistrict'] = addressParts[2].trim();
  }
  if (addressParts.length >= 4) {
    final List<String> pinCodeState = addressParts[3].trim().split(' ');
    if (pinCodeState.isNotEmpty) {
      addressInfo['PinCode'] = pinCodeState[0].trim();
    }
    if (pinCodeState.length >= 2) {
      addressInfo['StateCode'] = pinCodeState[1].trim();
    }
  }
  if (addressParts.length >= 5) {
    addressInfo['CountryCode'] = addressParts[4].trim();
  }

  // Extract mobile number and email address
  if (lineCount >= 3 && lines[lineCount - 2].startsWith('+')) {
    final String mobileAndEmail = lines[lineCount - 2].trim();
    final List<String> mobileEmailParts = mobileAndEmail.split(' ');
    if (mobileEmailParts.isNotEmpty) {
      addressInfo['CountryCodeMobile'] = mobileEmailParts[0].trim();
    }
    if (mobileEmailParts.length >= 2) {
      addressInfo['MobileNo'] = mobileEmailParts[1].trim();
    }
    if (lineCount >= 2) {
      addressInfo['EmailAddress'] = lines[lineCount - 1].trim();
    }
  }

  return addressInfo;
}

Map<String, dynamic> generateITR1Json(
  Map<String, dynamic> data,
  String aadhaar,
  String pan,
  String place,
  String address,
  String dob,
  String fatherName,
  String bankAccountNo,
  String bankName,
  String ifscCode,
) {
  print(data);

  final addressInfo =
      extractAddressInfo(data['PART B Name and Address of Employee'] ?? '');

  final addressModel = AddressModel.fromMap(addressInfo);

  Map<String, dynamic> nameParts = getNameParts(addressModel.residenceName);

  return {
    'Form_ITR1': {
      'FormName': 'ITR-1',
      'Description':
          'For Indls having Income from Salary, Pension, family pension and Interest',
      'AssessmentYear': '2022',
      'SchemaVer': 'Ver1.0',
      'FormVer': 'Ver1.0',
    },
    'PersonalInfo': {
      'AssesseeName': {
        'FirstName': nameParts['firstName'],
        'MiddleName': nameParts['middleName'],
        'SurNameOrOrgName': nameParts['lastName'],
      },
      'PAN': pan,
      'Address': addressInfo,
      'DOB': dob, // '1996-10-23'
      'EmployerCategory': 'OTH', // 'OTH'
      'AadhaarCardNo': aadhaar, // '600355915044'
    },
    'FilingStatus': {
      'ReturnFileSec': 11,
      'NewTaxRegime': 'N',
      'SeventhProvisio139': 'N',
    },
    'ITR1_IncomeDeductions': {
      'GrossSalary': data['GROSS SALARY (d) TOTAL'],
      'Salary': data['SALARY AS PER PROVISIONS CONTAINED IN SECTION 17(1)'],
      'PerquisitesValue': data[
          'VALUE OF PERQUISITES UNDER SECTION 17(2)(AS PER FORM NO 12BA, WHEREVER APPLICABLE)'],
      'ProfitsInSalary': data[
          'PROFITS IN LIEU OF SALARY UNDER SECTION 17(3)(AS PER FORM NO 12BA, WHEREVER APPLICABLE)'],
      'AllwncExemptUs10': {
        'TotalAllwncExemptUs10':
            data['HOUSE RENT ALLOWANCE UNDER SECTION 10(13A)'],
      },
      'NetSalary':
          data['TOTAL AMOUNT OF SALARY RECEIVED FROM CURRENT EMPLOYER'],
      'DeductionUs16': data['TOTAL AMOUNT OF DEDUCTIONS UNDER SECTION 16'],
      'DeductionUs16ia': data['STANDAR DEDUCTION UNDER SECTION 16(ia)'],
      'ProfessionalTaxUs16iii':
          data['TAX ON EMPLOYEMENT UNDER SECTION 16(iii)'],
      'IncomeFromSal': data['INCOME CHARGABLE UNDER THE HEAD "SALARIES"'],
      'GrossRentReceived': 0,
      'TaxPaidlocalAuth': 0,
      'AnnualValue': 0,
      'StandardDeduction': 0,
      'InterestPayable': data[
              'DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E GROSS AMOUNT'] +
          data[
              'DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E DEDUCTIBLE AMOUNT'],
      'ArrearsUnrealizedRentRcvd': 0,
      'TotalIncomeOfHP': data[
          'INCOME (OR ADMISSIBLE LOSS) FROM HOUSE PROPERTY REPORTED BY EMPLOYEE OFFERED FOR TDS'],
      'IncomeOthSrc':
          data['INCOME UNDER THE HEAD OTHER SOURCES OFFERED FOR TDS'],
      'OthersInc': {
        'OthersIncDtlsOthSrc': [
          {
            'OthSrcNatureDesc': 'OTH',
            'OthSrcOthNatOfInc': 'Other Item',
            'OthSrcOthAmount': ''
          }
        ]
      },
      "DeductionUs57iia": 0,
      "GrossTotIncome": data["GROSS TOTAL INCOME"],
      "UsrDeductUndChapVIA": {
        "Section80C": data[
            "DEDUCTIONS IN RESPECT OF LIFE INSURANCE PREMIA, CONTRIBUTIONS TO PF, ETC UNDER SECTION 80C DEDUCTIBLE AMOUNT"],
        "Section80CCC": data[
            "DEDUCTIONS IN RESPECT OF CONTRIBUTION TO CERTAIN PENSION FUNDS UNDER SECTION 80CCC DEDUCTIBLE AMOUNT"],
        "Section80CCDEmployeeOrSE": 0,
        "Section80CCD1B": data[
            "DEDUCTIONS IN RESPECT OF AMOUNT PAID/DEPOSITED TO NOTIFIED PENSION SCHEME UNDER 80CCD(1B) DEDUCTIBLE AMOUNT"],
        "Section80CCDEmployer": data[
            "DEDUCTIONS IN RESPECT OF CONTRIBUTION BY THE EMPLOYER TO PENSION SCHEME UNDER SECTION 80CCD(2) DEDUCTIBLE AMOUNT"],
        "Section80D": data[
            "DEDUCTIONS IN RESPECT OF HEALTH INSURANCE PREMIA UNDER SECTION 80D DEDUCTIBLE AMOUNT"],
        "Section80DD": 0,
        "Section80DDB": 0,
        "Section80E": data[
            "DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E DEDUCTIBLE AMOUNT"],
        "Section80EE": 0,
        "Section80EEA": 0,
        "Section80EEB": 0,
        "Section80G":
            "TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G DEDUCTIBLE AMOUNT",
        "Section80GG": 0,
        "Section80GGA": 0,
        "Section80GGC": 0,
        "Section80U": 0,
        "Section80TTA": data[
            "DEDUCTION IN RESPECT OF INTEREST ON DEPOSITS IN SAVINGS ACCOUNT UNDER SECTION 80TTA DEDUCTIBLE AMOUNT"],
        "Section80TTB": 0,
        "TotalChapVIADeductions":
            data["AGGREGATE OF DEDUCTIBLE AMOUNT UNDER CHAPTER VI-A"],
      },
      "DeductUndChapVIA": {
        "Section80C": data[
            "DEDUCTIONS IN RESPECT OF LIFE INSURANCE PREMIA, CONTRIBUTIONS TO PF, ETC UNDER SECTION 80C DEDUCTIBLE AMOUNT"],
        "Section80CCC": data[
            "DEDUCTIONS IN RESPECT OF CONTRIBUTION TO CERTAIN PENSION FUNDS UNDER SECTION 80CCC DEDUCTIBLE AMOUNT"],
        "Section80CCDEmployeeOrSE": 0,
        "Section80CCD1B": 0,
        "Section80CCDEmployer": data[
            "DEDUCTIONS IN RESPECT OF CONTRIBUTION BY THE EMPLOYER TO PENSION SCHEME UNDER SECTION 80CCD(2) DEDUCTIBLE AMOUNT"],
        "Section80D": data[
            "DEDUCTIONS IN RESPECT OF HEALTH INSURANCE PREMIA UNDER SECTION 80D DEDUCTIBLE AMOUNT"],
        "Section80DD": 0,
        "Section80DDB": 0,
        "Section80E": data[
            "DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E DEDUCTIBLE AMOUNT"],
        "Section80EE": 0,
        "Section80EEA": 0,
        "Section80EEB": 0,
        "Section80G": data[
            "TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G DEDUCTIBLE AMOUNT"],
        "Section80GG": 0,
        "Section80GGA": 0,
        "Section80GGC": 0,
        "Section80U": 0,
        "Section80TTA": data[
            "DEDUCTION IN RESPECT OF INTEREST ON DEPOSITS IN SAVINGS ACCOUNT UNDER SECTION 80TTA DEDUCTIBLE AMOUNT"],
        "Section80TTB": 0,
        "TotalChapVIADeductions":
            data["AGGREGATE OF DEDUCTIBLE AMOUNT UNDER CHAPTER VI-A"],
      },
      "TotalIncome": data["TOTAL TAXABLE INCOME"],
      "ExemptIncAgriOthUs10": {"ExemptIncAgriOthUs10Total": 0},
      "IncomeNotified89A": 0,
      "IncomeNotifiedOther89A": 0,
      "Increliefus89A": 0,
      "Increliefus89AOS": 0
    },
    "ITR1_TaxComputation": {
      "TotalTaxPayable": data["NET TAX PAYABLE"],
      "Rebate87A": data["REBATE UNDER SECTION 87A, IF APPLICABLE"],
      "TaxPayableOnRebate": 0,
      "EducationCess": data["HEALTH AND EDUCATION CESS"],
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
    "TaxPaid": {
      "TaxesPaid": {
        "AdvanceTax": 0,
        "TDS": 0,
        "TCS": 0,
        "SelfAssessmentTax": 0,
        "TotalTaxesPaid": 0
      },
      "BalTaxPayable": 0
    },
    "Refund": {
      "RefundDue": 0,
      "BankAccountDtls": {
        "AddtnlBankDetails": [
          {
            "IFSCCode": ifscCode, // SBIN0013183
            "BankName": bankName, // STATE BANK OF INDIA
            "BankAccountNo": bankAccountNo, // 3586943737
            "UseForRefund": "true"
          }
        ]
      }
    },
    "Schedule80G": {
      "TotalDonationsUs80GCash": 0,
      "TotalDonationsUs80GOtherMode": 0,
      "TotalDonationsUs80G": data[
          "TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G QUALIFYING AMOUNT"],
      "TotalEligibleDonationsUs80G": data[
          "TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G DEDUCTIBLE AMOUNT"],
    },
    "Schedule80D": {
      "Sec80DSelfFamSrCtznHealth": {
        "SeniorCitizenFlag": "S",
        "SelfAndFamily": 0,
        "HealthInsPremSlfFam": data[
            "DEDUCTIONS IN RESPECT OF HEALTH INSURANCE PREMIA UNDER SECTION 80D DEDUCTIBLE AMOUNT"],
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
    "TDSonOthThanSals": {"TotalTDSonOthThanSals": 0},
    "ScheduleTDS3Dtls": {"TotalTDS3Details": 0},
    "ScheduleTCS": {"TotalSchTCS": 0},
    "Verification": {
      "Declaration": {
        "AssesseeVerName": data["VERIFICATION FULL NAME"],
        "FatherName": fatherName, // Ramkishore
        "AssesseeVerPAN": data["PART B Pan of Employee"],
      },
      "Capacity": "S",
      "Place": addressInfo['CityOrTownOrDistrict'] // GWALIOR
    },
  };
}
