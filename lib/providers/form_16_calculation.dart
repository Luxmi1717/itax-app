import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../models/taxpayable_form16.dart';

class From16Calculation with ChangeNotifier {
  final TextEditingController _textBasicController = TextEditingController();
  final TextEditingController _textHRAController1 = TextEditingController();
  final TextEditingController _textbonusController = TextEditingController();

  final TextEditingController _salaryother = TextEditingController();
  final TextEditingController _textLessSD = TextEditingController();
  final TextEditingController _ProfessionalTax = TextEditingController();

  TextEditingController get textBasicController => _textBasicController;
  TextEditingController get textHRAController => _textHRAController1;
  TextEditingController get textbonusController => _textbonusController;
  TextEditingController get salaryother => _salaryother;
  TextEditingController get textLessSD => _textLessSD;
  TextEditingController get ProfessionalTax => _ProfessionalTax;


  /// Sellerry calculator
  double _salary = 0;
  double get salary => _salary;


  bool _basic_year = true;
  bool get basic_year => _basic_year;

  bool _hra_year = true;
  bool get hra_year => _hra_year;

  bool _bonus_year = true;
  bool get bonus_year => _bonus_year;

  bool _other_year = true;
  bool get other_year => _other_year;


  changeBasicSwitch(bool val){
    _basic_year = val;
    _textBasicController.text = _basic_year ? (double.parse(_textBasicController.text) * 12).toString() : (double.parse(_textBasicController.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    notifyListeners();
    notifyListeners();
  }
  changeOtherSwitch(bool val){
    _other_year = val;
    _salaryother.text = _other_year ? (double.parse(_salaryother.text) * 12).toString() : (double.parse(_salaryother.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    notifyListeners();
    notifyListeners();
  }
  changeBonusSwitch(bool val){
    _bonus_year = val;
    _textbonusController.text = _bonus_year ? (double.parse(_textbonusController.text) * 12).toString() : (double.parse(_textbonusController.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    notifyListeners();
    notifyListeners();
  }
  changeHraSwitch(bool val){
    _hra_year = val;
    _textHRAController1.text = _hra_year ? (double.parse(_textHRAController1.text) * 12).toString() : (double.parse(_textHRAController1.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    notifyListeners();
    notifyListeners();
  }


  /// House Property Calculator

  bool _intrestOnHouseLoan = true;
  bool get intrestOnHouseLoan => _intrestOnHouseLoan;

  IntrestOnHouseLoanValue(bool val){
    _intrestOnHouseLoan = val;
    housingLoanTextController.text = _intrestOnHouseLoan ? (double.parse(housingLoanTextController.text) * 12).toString() : (double.parse(housingLoanTextController.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    notifyListeners();
  }

  bool _anualLableValue = true;
  bool get anualLableValue => _anualLableValue;

  anualLableValueM(bool val){
    _anualLableValue = val;
    AnnualRentReceivedTextControler.text = _anualLableValue ? (double.parse(AnnualRentReceivedTextControler.text) * 12).toString() : (double.parse(AnnualRentReceivedTextControler.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    notifyListeners();
  }

  bool _lessMuncipalTexesValue = true;
  bool get lessMuncipalTexesValue => _lessMuncipalTexesValue;

  lessMuncipalTexesValueM(bool val){
    _lessMuncipalTexesValue = val;
    MunicipalTaxesPaidTextControler.text = _lessMuncipalTexesValue ? (double.parse(MunicipalTaxesPaidTextControler.text) * 12).toString() : (double.parse(MunicipalTaxesPaidTextControler.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    notifyListeners();
  }

  bool _lessUnrealized = true;
  bool get lessUnrealized => _lessUnrealized;

  lessUnrealizedValue(bool val){
    _lessUnrealized = val;
    UnrealizedTextControler.text = _lessUnrealized ? (double.parse(UnrealizedTextControler.text) * 12).toString() : (double.parse(UnrealizedTextControler.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    notifyListeners();
  }

  bool _lessDeductions = true;
  bool get lessDeductions => _lessDeductions;

  lessDeductionsValue(bool val){
    _lessDeductions = val;
    LessDeductionFromNetAnnualTextControler.text = _lessDeductions ? (double.parse(LessDeductionFromNetAnnualTextControler.text) * 12).toString() : (double.parse(LessDeductionFromNetAnnualTextControler.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    notifyListeners();
  }

  bool _intrestOnHouseLoan2 = true;
  bool get intrestOnHouseLoan2 => _intrestOnHouseLoan2;

  intrestOnHouseLoan2Value(bool val){
    _intrestOnHouseLoan2 = val;
    InterestHousingLoanTextControler.text = _intrestOnHouseLoan2 ? (double.parse(InterestHousingLoanTextControler.text) * 12).toString() : (double.parse(InterestHousingLoanTextControler.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    notifyListeners();
  }


  /// Other Sources

  bool _otherSourceM2 = true;
  bool get otherSourceB => _otherSourceM2;

  otherSourceValue(bool val){
    _otherSourceM2 = val;
    interestDeposit.text = _otherSourceM2 ? (double.parse(interestDeposit.text) * 12).toString() : (double.parse(interestDeposit.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    totalIncome();
    SetNetamount();
    setincome();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    notifyListeners();
  }

  bool _fromSolvingBank = true;
  bool get fromSolvingBank => _fromSolvingBank;

  fromSolvingBankValue(bool val){
    _fromSolvingBank = val;
    interestAccount.text = _fromSolvingBank ? (double.parse(interestAccount.text) * 12).toString() : (double.parse(interestAccount.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    totalIncome();
    SetNetamount();
    setincome();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    notifyListeners();
  }

  bool _otherSourceM = true;
  bool get otherSourceM => _otherSourceM;

  otherSourceMValue(bool val){
    _otherSourceM = val;
    otherSource.text = _otherSourceM ? (double.parse(otherSource.text) * 12).toString() : (double.parse(otherSource.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    totalIncome();
    SetNetamount();
    setincome();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    notifyListeners();
  }


  /// Business and profession

  bool _bussinessV = true;
  bool get bussinessV => _bussinessV;

  bussinessValue(bool val){
    _bussinessV = val;
    business.text = _bussinessV ? (double.parse(business.text) * 12).toString() : (double.parse(business.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  bool _professionV = true;
  bool get professionV => _professionV;

  professionValue(bool val){
    _professionV = val;
    profession.text = _professionV ? (double.parse(profession.text) * 12).toString() : (double.parse(profession.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// 80 C

  bool _providentFound = true;
  bool get providentFound => _providentFound;

  providentFoundValue(bool val){
    _providentFound = val;
    textEmployeeFund.text = _providentFound ? (double.parse(textEmployeeFund.text) * 12).toString() : (double.parse(textEmployeeFund.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  bool _SavingScheme = true;
  bool get SavingScheme => _SavingScheme;

  SavingSchemeValue(val){
    _SavingScheme = val;
    textEquityScheme.text = _SavingScheme ? (double.parse(textEquityScheme.text) * 12).toString() : (double.parse(textEquityScheme.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  bool _lifeInurance = true;
  bool get lifeInurance => _lifeInurance;

  lifeInuranceValue(val){
    _lifeInurance = val;
    textLifeInsurance.text = _lifeInurance ? (double.parse(textLifeInsurance.text) * 12).toString() : (double.parse(textLifeInsurance.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  bool _publicProvicentFund = true;
  bool get publicProvicentFund => _publicProvicentFund;

  publicProvicentFundValue(val){
    _publicProvicentFund = val;
    textProvidentFund.text = _publicProvicentFund ? (double.parse(textProvidentFund.text) * 12).toString() : (double.parse(textProvidentFund.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  bool _tuitionFees = true;
  bool get tuitionFees => _tuitionFees;

  tuitionFeesValue(val){
    _tuitionFees = val;
    texttuitionfees.text = _tuitionFees ? (double.parse(texttuitionfees.text) * 12).toString() : (double.parse(texttuitionfees.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  bool _HousingLoanPrincipal = true;
  bool get HousingLoanPrincipal => _HousingLoanPrincipal;

  HousingLoanPrincipalValue(val){
    _HousingLoanPrincipal = val;
    textHousingLoan.text = _HousingLoanPrincipal ? (double.parse(textHousingLoan.text) * 12).toString() : (double.parse(textHousingLoan.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  bool _NationalPensionScheme = true;
  bool get NationalPensionScheme => _NationalPensionScheme;

  NationalPensionSchemeValue(val){
    _NationalPensionScheme = val;
    textNationalScheme.text = _NationalPensionScheme ? (double.parse(textNationalScheme.text) * 12).toString() : (double.parse(textNationalScheme.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  bool _OthersM = true;
  bool get OthersM => _OthersM;

  OthersMValue(val){
    _OthersM = val;
    textother80C.text = _OthersM ? (double.parse(textother80C.text) * 12).toString() : (double.parse(textother80C.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  /// 80DD

  bool _more80 = true;
  bool get more80 => _more80;

  more80moreValue(val){
    _more80 = val;
    amountSpent.text = _more80 ? (double.parse(amountSpent.text) * 12).toString() : (double.parse(amountSpent.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// 80DDB
  bool _MedicalTreatmentExpenses = true;
  bool get MedicalTreatmentExpenses => _MedicalTreatmentExpenses;

  MedicalTreatmentExpensesValue(val){
    _MedicalTreatmentExpenses = val;
    text80DDB.text = _MedicalTreatmentExpenses ? (double.parse(text80DDB.text) * 12).toString() : (double.parse(text80DDB.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  /// Section 24
  bool _InterestonHomeLoan = true;
  bool get InterestonHomeLoan => _InterestonHomeLoan;

  InterestonHomeLoanValue(val){
    _InterestonHomeLoan = val;
    textSextion24B.text = _InterestonHomeLoan ? (double.parse(textSextion24B.text) * 12).toString() : (double.parse(textSextion24B.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// 80CCD
  bool _NationalPensionshemeaddbenefit = true;
  bool get NationalPensionshemeaddbenefit => _NationalPensionshemeaddbenefit;

  NationalPensionshemeaddbenefitValue(val){
    _NationalPensionshemeaddbenefit = val;
    text80CCD1B.text = _NationalPensionshemeaddbenefit ? (double.parse(text80CCD1B.text) * 12).toString() : (double.parse(text80CCD1B.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  /// 80EEA
  bool _InterestonloanforaffordableHousing = true;
  bool get InterestonloanforaffordableHousing => _InterestonloanforaffordableHousing;

  InterestonloanforaffordableHousingValue(val){
    _InterestonloanforaffordableHousing = val;
    text80EEA.text = _InterestonloanforaffordableHousing ? (double.parse(text80EEA.text) * 12).toString() : (double.parse(text80EEA.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  /// Food Coupons
  bool _FoodCouponsM = true;
  bool get FoodCouponsM => _FoodCouponsM;

  FoodCouponsValue(val){
    _FoodCouponsM = val;
    textFoodCoupons.text = _FoodCouponsM ? (double.parse(textFoodCoupons.text) * 12).toString() : (double.parse(textFoodCoupons.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  /// 80U
  bool _DeductionforDisabledIndividuals = true;
  bool get DeductionforDisabledIndividuals => _DeductionforDisabledIndividuals;

  DeductionforDisabledIndividualsValue(val){
    _DeductionforDisabledIndividuals = val;
    text80u.text = _DeductionforDisabledIndividuals ? (double.parse(text80u.text) * 12).toString() : (double.parse(text80u.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// 80EEB
  bool _InterestonLoanforpurchaseofElectricvehical = true;
  bool get InterestonLoanforpurchaseofElectricvehical => _InterestonLoanforpurchaseofElectricvehical;

  InterestonLoanforpurchaseofElectricvehicalValue(val){
    _InterestonLoanforpurchaseofElectricvehical = val;
    text80EEB.text = _InterestonLoanforpurchaseofElectricvehical ? (double.parse(text80EEB.text) * 12).toString() : (double.parse(text80EEB.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  /// 80E
  bool _InterestonEducationLoan = true;
  bool get InterestonEducationLoan => _InterestonEducationLoan;

  InterestonEducationLoanValue(val){
    _InterestonEducationLoan = val;
    text80E.text = _InterestonEducationLoan ? (double.parse(text80E.text) * 12).toString() : (double.parse(text80E.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// G-Eligible Deduction 50%
  bool _donations = true;
  bool get donations => _donations;

  donationsValue(val){
    _donations = val;
    text80g.text = _donations ? (double.parse(text80g.text) * 12).toString() : (double.parse(text80g.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  /// 80G-elg Deduction 100%
  bool _donations2 = true;
  bool get donations2 => _donations2;

  donations2Value(val){
    _donations2 = val;
    text80g100.text = _donations2 ? (double.parse(text80g100.text) * 12).toString() : (double.parse(text80g100.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// Donations for Scientific Research and Rural
  bool _DonationsforScientificResearchandRural = true;
  bool get DonationsforScientificResearchandRural => _DonationsforScientificResearchandRural;

  DonationsforScientificResearchandRuralValue(val){
    _DonationsforScientificResearchandRural = val;
    text80GGA.text = _DonationsforScientificResearchandRural ? (double.parse(text80GGA.text) * 12).toString() : (double.parse(text80GGA.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// Contribution to Poiltical Parties
  bool _ContributiontoPoilticalParties = true;
  bool get ContributiontoPoilticalParties => _ContributiontoPoilticalParties;

  ContributiontoPoilticalPartiesValue(val){
    _ContributiontoPoilticalParties = val;
    text80GGC.text = _ContributiontoPoilticalParties ? (double.parse(text80GGC.text) * 12).toString() : (double.parse(text80GGC.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGC();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// Other Examptions
  bool _OtherExamptions = true;
  bool get OtherExamptions => _OtherExamptions;

  OtherExamptionsValue(val){
    _OtherExamptions = val;
    textOtherExp.text = _OtherExamptions ? (double.parse(textOtherExp.text) * 12).toString() : (double.parse(textOtherExp.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGC();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setOtherExp();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// Interest From Saving Accounts
  bool _InterestFromSavingAccounts = true;
  bool get InterestFromSavingAccounts => _InterestFromSavingAccounts;

  InterestFromSavingAccountsValue(val){
    _InterestFromSavingAccounts = val;
    text80TTA.text = _InterestFromSavingAccounts ? (double.parse(text80TTA.text) * 12).toString() : (double.parse(text80TTA.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGC();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setOtherExp();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80TTA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// 80 TTA
  bool _TTa80 = true;
  bool get TTa80 => _TTa80;

  TTa80Value(val){
    _TTa80 = val;
    text80TTB.text = _TTa80 ? (double.parse(text80TTB.text) * 12).toString() : (double.parse(text80TTB.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGC();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setOtherExp();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80TTA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80TTB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// 80 CCD
  bool _CCD80M = true;
  bool get CCD80M => _CCD80M;

  CCD80Value(val){
    _CCD80M = val;
    text80CCD.text = _CCD80M ? (double.parse(text80CCD.text) * 12).toString() : (double.parse(text80CCD.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGC();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setOtherExp();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80TTA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80TTB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80CCD();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// Standard Deduction
  bool _StandardDeduction = true;
  bool get StandardDeduction => _StandardDeduction;

  StandardDeductionValue(val){
    _StandardDeduction = val;
    textStardDeduction.text = _StandardDeduction ? (double.parse(textStardDeduction.text) * 12).toString() : (double.parse(textStardDeduction.text)/12).toString();
    SetHousigLoan();
    salarytotal();
    SetNetamount();
    SetHousigLoanLetOutProperty();
    settotalInterest();
    SetNetamount();
    Set30PercentageNetAnnual();
    SetLetOutHousePropert();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    setTotaldC80();
    setVisibleC80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    calculateTaxDeduction1();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80DDB();
    SetNetamount();
    setincome();
    setSection24();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setCCD80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setEEA80();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setFoodCoupons();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80u();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80EEB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80E();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set100G();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80GGC();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setOtherExp();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80TTA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80TTB();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    set80CCD();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    setStardDeduction();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    notifyListeners();
  }


  void calSalaryUsingSwitch() {
    SetHousigLoan();
    SetLetOutHousePropert();

    double basic = double.tryParse(_textBasicController.text) ?? 0;
    double HRA = double.tryParse(_textHRAController1.text) ?? 0;
    double bonus = double.tryParse(_textbonusController.text) ?? 0;
    double other = double.tryParse(_salaryother.text) ?? 0;

    double LessSd = double.tryParse(_textLessSD.text) ?? 0;
    double professional = double.tryParse(_ProfessionalTax.text) ?? 0;


    if (housingLoan != 0) {
      _salary = basic + HRA + bonus + other - housingLoan;

    } else {
      _salary = basic + HRA + bonus + other - TotalLetOutHouseProperty.abs();
    }

    notifyListeners();
  }

  void salarytotal() {
    SetHousigLoan();
    SetLetOutHousePropert();

    double basic = double.tryParse(_textBasicController.text) ?? 0;
    double HRA = double.tryParse(_textHRAController1.text) ?? 0;
    double bonus = double.tryParse(_textbonusController.text) ?? 0;
    double other = double.tryParse(_salaryother.text) ?? 0;

    double LessSd = double.tryParse(_textLessSD.text) ?? 0;
    double professional = double.tryParse(_ProfessionalTax.text) ?? 0;



    if (housingLoan != 0) {
      _salary = basic + HRA + bonus + other - housingLoan;

    } else {
      _salary = basic + HRA + bonus + other - TotalLetOutHouseProperty.abs();
    }



/*if(_salary<50000 && _salary>LessSd)
  {
    _salary=salary-LessSd;
  }
else{
  if(_salary>=50000)
   {
    _salary = salary - 50000;
    textLessSD.value =
        TextEditingValue(text: '50000');
  }
}
if(professional<=5000 && salary>professional)
{
  _salary=salary-professional;
}else{
  if(_salary>=5000) {
    _salary = salary - 5000;
  }
}*/

    notifyListeners();
  }

//house Property income from House Property

  final TextEditingController _housingLoanTextControler =
      TextEditingController();
  TextEditingController get housingLoanTextController =>
      _housingLoanTextControler;

  double _housingLoan = 0.0;
  double get housingLoan => _housingLoan;
  void SetHousigLoan() {
    double housingLoanTextController =
        double.tryParse(_housingLoanTextControler.text) ?? 0;
    if (housingLoanTextController < 20000) {
      _housingLoan = housingLoanTextController;
    } else {
      _housingLoan = 200000;
    }
    notifyListeners();
  }

  //house property Housing Loan let_out property

  final TextEditingController _AnnualRentReceivedTextControler =
      TextEditingController();
  final TextEditingController _MunicipalTaxesPaidTextControler =
      TextEditingController();
  final TextEditingController _UnrealizedTextControler =
      TextEditingController();
  final TextEditingController _NetAnnualValueTextControler =
      TextEditingController();
  final TextEditingController _LessDeductionFromNetAnnualTextControler =
      TextEditingController();
  final TextEditingController _InterestHousingLoanTextControler =
      TextEditingController();
  final TextEditingController _StandardDeduction30TextControler =
      TextEditingController();
  final TextEditingController _LetOutHousePropertyTextControler =
      TextEditingController();

  TextEditingController get AnnualRentReceivedTextControler =>
      _AnnualRentReceivedTextControler;
  TextEditingController get MunicipalTaxesPaidTextControler =>
      _MunicipalTaxesPaidTextControler;
  TextEditingController get UnrealizedTextControler => _UnrealizedTextControler;
  TextEditingController get LetOutHousePropertyTextControler =>
      _LetOutHousePropertyTextControler;
  TextEditingController get NetAnnualValueTextControler =>
      _NetAnnualValueTextControler;
  TextEditingController get LessDeductionFromNetAnnualTextControler =>
      _LessDeductionFromNetAnnualTextControler;
  TextEditingController get InterestHousingLoanTextControler =>
      _InterestHousingLoanTextControler;
  TextEditingController get StandardDeduction30TextControler =>
      _StandardDeduction30TextControler;

  double _TotalAnnualLetableValue = 0;
  double get TotalAnnualLetableValue => _TotalAnnualLetableValue;
  double _TotalStandardDeduction30Percentage = 0;
  double get TotalStandardDeduction30Percentage =>
      _TotalStandardDeduction30Percentage;

  void SetHousigLoanLetOutProperty() {
    double AnnualRentReceived =
        double.tryParse(_AnnualRentReceivedTextControler.text) ?? 0;
    double MunicipalTaxesPaid =
        double.tryParse(_MunicipalTaxesPaidTextControler.text) ?? 0;
    double Unrealized = double.tryParse(_UnrealizedTextControler.text) ?? 0;
    double LetOutHouseProperty =
        double.tryParse(_LetOutHousePropertyTextControler.text) ?? 0;
    double NetAnnualValue =
        double.tryParse(_NetAnnualValueTextControler.text) ?? 0;
    double LessDeductionFromNetAnnual =
        double.tryParse(_LessDeductionFromNetAnnualTextControler.text) ?? 0;

    double StandardDeduction30 =
        double.tryParse(_StandardDeduction30TextControler.text) ?? 0;
    _TotalAnnualLetableValue = AnnualRentReceived -
        MunicipalTaxesPaid -
        Unrealized -
        LessDeductionFromNetAnnual;

    notifyListeners();
  }

  void Set30PercentageNetAnnual() {
    _TotalStandardDeduction30Percentage =
        _TotalAnnualLetableValue - (_TotalAnnualLetableValue * 0.3);
    notifyListeners();
  }

  double _TotalLetOutHouseProperty = 0;
  double get TotalLetOutHouseProperty => _TotalLetOutHouseProperty;

  void SetLetOutHousePropert() {
    double InterestHousingLoan =
        double.tryParse(_InterestHousingLoanTextControler.text) ?? 0;
    _TotalLetOutHouseProperty =
        _TotalStandardDeduction30Percentage - InterestHousingLoan;
    notifyListeners();
  }

  //capital gain
  final TextEditingController _shorCapitalController = TextEditingController();
  final TextEditingController _longCapitalController = TextEditingController();
  final TextEditingController _longCapital10Controller =
      TextEditingController();

  final TextEditingController _shortCapital15Controller =
      TextEditingController();

  double _totalCapital = 0.0;

  TextEditingController get textshorCapital => _shorCapitalController;
  TextEditingController get longCapital => _longCapitalController;
  TextEditingController get longCapital10Controller => _longCapital10Controller;
  TextEditingController get shortCapital15 => _shortCapital15Controller;

  double get totalcapital => _totalCapital;

  void settotalCapital() {
    double shorCapital = double.tryParse(_shorCapitalController.text) ?? 0;
    double longCapital = double.tryParse(_longCapitalController.text) ?? 0;
    double longCapital10 = double.tryParse(_longCapital10Controller.text) ?? 0;
    double shortCapital15 =
        double.tryParse(_shortCapital15Controller.text) ?? 0;
    _totalCapital = shorCapital + shortCapital15 + longCapital10 + longCapital;
    notifyListeners();
  }

  final TextEditingController _interestDeposit = TextEditingController();
  final TextEditingController _interestAccount = TextEditingController();
  final TextEditingController _otherSource = TextEditingController();

  double _totalinterest = 0.0;
  double get totalinterest => _totalinterest;
  TextEditingController get interestDeposit => _interestDeposit;
  TextEditingController get interestAccount => _interestAccount;
  TextEditingController get otherSource => _otherSource;

  void settotalInterest() {
    double fixed = double.tryParse(_interestDeposit.text) ?? 0;
    double bankAcount = double.tryParse(_interestAccount.text) ?? 0;
    double otherInterest = double.tryParse(_otherSource.text) ?? 0;
    _totalinterest = fixed + bankAcount + otherInterest;
    notifyListeners();
  }

  final TextEditingController _business = TextEditingController();
  final TextEditingController _profession = TextEditingController();

  double _totalBusiness = 0.0;

  TextEditingController get business => _business;
  TextEditingController get profession => _profession;

  double get totalBusiness => _totalBusiness;

  void settotalbusiness() {
    double business = double.tryParse(_business.text) ?? 0;
    double profession = double.tryParse(_profession.text) ?? 0;

    _totalBusiness = business + profession;
    notifyListeners();
  }

  double _TotalIncome = 0.0;
  double get TotalIncone => _TotalIncome;

  void totalIncome() {
    _TotalIncome = totalBusiness + totalcapital + salary + totalinterest;
    notifyListeners();
  }

//calculation of exaption and reduction

  int _selectedValue = 1;
  double _u80 = 0.0;
  double _totalu80 = 0.0;
  int get selectvalue => _selectedValue;
  double get u80 => _u80;
  double get totalu80 => _totalu80;

  void setu80(double Salary) {
    _u80 = Salary;
    notifyListeners();
  }

  void setTotalu80() {
    if (selectvalue == 1) {
      _totalu80 = u80 - 10000;
    } else if (selectvalue == 2) {
      _totalu80 = u80 - 25000;
    } else {
      _totalu80 = u80 - 50000;
    }
    notifyListeners();
  }

  void setSelected(int select) {
    _selectedValue = select;
    notifyListeners();
  }

  final int _selectedValue1 = 1;
  final double _DD80 = 0.0;
  final double _totaldd80 = 0.0;
  int get selectvalue1 => _selectedValue1;
  double get DD80 => _DD80;
  double get totaldd80 => _totaldd80;

  void setSelected1(int select) {
    _selectedValue = select;
    notifyListeners();
  }

  double _g80 = 0.0;
  final double _totalg80 = 0.0;

  double get G80 => _g80;

  double get totalg80 => _totalg80;
  void setg80(double Salary) {
    _g80 = Salary / 2;
    notifyListeners();
  }

//80C calculation with provider
  final TextEditingController _textEmployeeFund = TextEditingController();
  final TextEditingController _textEquityScheme = TextEditingController();
  final TextEditingController _textLifeInsurance = TextEditingController();

  final TextEditingController _textProvidentFund = TextEditingController();
  final TextEditingController _texttuitionfees = TextEditingController();
  final TextEditingController _textHousingLoan = TextEditingController();
  final TextEditingController _textNationalScheme = TextEditingController();

  final TextEditingController _textother80C = TextEditingController();

  TextEditingController get textEmployeeFund => _textEmployeeFund;
  TextEditingController get textEquityScheme => _textEquityScheme;
  TextEditingController get textLifeInsurance => _textLifeInsurance;

  TextEditingController get textProvidentFund => _textProvidentFund;
  TextEditingController get texttuitionfees => _texttuitionfees;
  TextEditingController get textHousingLoan => _textHousingLoan;
  TextEditingController get textNationalScheme => _textNationalScheme;

  TextEditingController get textother80C => _textother80C;

  double _total80C = 0.0;
  double _visible80C = 0.0;

  double get total80C => _total80C;

  double get visible80C => _visible80C;

  void setTotaldC80() {
    double EmplayeeFund = double.tryParse(_textEmployeeFund.text) ?? 0;
    double EquityScheme = double.tryParse(_textEquityScheme.text) ?? 0;
    double LifeInsurance = double.tryParse(_textLifeInsurance.text) ?? 0;
    double ProvidentFund = double.tryParse(_textProvidentFund.text) ?? 0;

    double tuitionfees = double.tryParse(_texttuitionfees.text) ?? 0;
    double HousingLoan = double.tryParse(_textHousingLoan.text) ?? 0;
    double NationalScheme = double.tryParse(_textNationalScheme.text) ?? 0;

    double other80C = double.tryParse(_textother80C.text) ?? 0;
    _total80C = EmplayeeFund +
        EquityScheme +
        LifeInsurance +
        ProvidentFund +
        tuitionfees +
        HousingLoan +
        NationalScheme +
        other80C;
    notifyListeners();
  }

  void setVisibleC80() {
    if (total80C < 150000) {
      _visible80C = total80C;
    } else {
      _visible80C = 150000;
    }
    notifyListeners();
  }

  final TextEditingController _amountSpent = TextEditingController();
  TextEditingController get amountSpent => _amountSpent;
  double _taxDeduction = 0;
  double get texDeduction => _taxDeduction;
  double _disabilityPercentage = 40;
  double get disabilityPercentage => _disabilityPercentage;
  void setdisbilityPercentag(value) {
    _disabilityPercentage = value;
    notifyListeners();
  }

  void calculateTaxDeduction1() {
    double amountspent = double.tryParse(_amountSpent.text) ?? 0;
    _taxDeduction = calculateTaxDeduction(amountspent, _disabilityPercentage);
    notifyListeners();
  }

//calculation of 80DDB

  final TextEditingController _text80DDB = TextEditingController();
  TextEditingController get text80DDB => _text80DDB;

  double get deductionAmount => _deductionAmount;
  final double _agepercent = 60;
  double get agepercent => _agepercent;

  double _deductionAmount = 0.0;

  void setagapercent(value) {
    _disabilityPercentage = value;
    notifyListeners();
  }

  void set80DDB() {
    double amount80DDB = double.tryParse(_text80DDB.text) ?? 0;
    if (amount80DDB <= 40000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _deductionAmount = amount80DDB;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      if (_agepercent < 60) {
        _deductionAmount = 80000;
      } else {
        _deductionAmount = 100000;
      }
    }

    notifyListeners();
  }
  //calculation of Section 24C

  final TextEditingController _textSection24B = TextEditingController();
  TextEditingController get textSextion24B => _textSection24B;

  double _section24 = 0.0;
  double get section24 => _section24;

  void setSection24() {
    double amountSetSection = double.tryParse(_textSection24B.text) ?? 0;
    if (amountSetSection <= 200000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _section24 = amountSetSection;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _section24 = 200000;
    }
    notifyListeners();
  }
  //calcalution of 80CCD(1B)

  final TextEditingController _text80CCD1B = TextEditingController();
  TextEditingController get text80CCD1B => _text80CCD1B;

  double _80CCD = 0.0;
  double get CCD80 => _80CCD;

  void setCCD80() {
    double amount80CCD = double.tryParse(_text80CCD1B.text) ?? 0;
    if (amount80CCD <= 50000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _80CCD = amount80CCD;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _80CCD = 50000;
    }
    notifyListeners();
  }

//calcalution of 80EEA

  final TextEditingController _text80EEA = TextEditingController();
  TextEditingController get text80EEA => _text80EEA;

  double _80EEA = 0.0;
  double get EEA80 => _80EEA;

  void setEEA80() {
    double amount80CCD = double.tryParse(_text80EEA.text) ?? 0;
    if (amount80CCD <= 150000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _80EEA = amount80CCD;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _80EEA = 150000;
    }
    notifyListeners();
  }
  //calcalution of Food Coupons

  final TextEditingController _textFoodCoupons = TextEditingController();
  TextEditingController get textFoodCoupons => _textFoodCoupons;

  double _FoodCoupons = 0.0;
  double get FoodCoupons => _FoodCoupons;

  void setFoodCoupons() {
    double amountFoodCoupons = double.tryParse(_textFoodCoupons.text) ?? 0;
    if (amountFoodCoupons <= 26400) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _FoodCoupons = amountFoodCoupons;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _FoodCoupons = 26400;
    }
    notifyListeners();
  }

  //Calculation of 80U
  final TextEditingController _text80u = TextEditingController();
  TextEditingController get text80u => _text80u;

  double _U80 = 0.0;
  double get U80 => _U80;

  void set80u() {
    double amount80u = double.tryParse(_text80u.text) ?? 0;
    if (amount80u <= 125000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _U80 = amount80u;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _U80 = 125000;
    }
    notifyListeners();
  }

  //Calculation of 80EEB
  final TextEditingController _text80EEB = TextEditingController();
  TextEditingController get text80EEB => _text80EEB;

  double _EEB80 = 0.0;
  double get EEB80 => _EEB80;

  void set80EEB() {
    double amount80EEB = double.tryParse(_text80EEB.text) ?? 0;
    if (amount80EEB <= 150000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _EEB80 = amount80EEB;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _EEB80 = 150000;
    }
    notifyListeners();
  }

//calculation of 80E

  final TextEditingController _text80E = TextEditingController();
  TextEditingController get text80E => _text80E;

  double _E80 = 0.0;
  double get E80 => _E80;

  void set80E() {
    double amount80E = double.tryParse(_text80E.text) ?? 0;
    _E80 = amount80E;
    notifyListeners();
  }

//calculation of 80G 50%

  final TextEditingController _text80g = TextEditingController();
  TextEditingController get text80g => _text80g;

  double _G80 = 0.0;
  double get g80 => _G80;

  void set80G() {
    double amount80g = double.tryParse(_text80g.text) ?? 0;
    _G80 = amount80g / 2;
    notifyListeners();
  }

  //calculation of 80G 100%

  final TextEditingController _text100g = TextEditingController();
  TextEditingController get text80g100 => _text100g;

  double _G100 = 0.0;
  double get g100 => _G100;

  void set100G() {
    double amount100g = double.tryParse(_text100g.text) ?? 0;
    _G100 = amount100g;
    notifyListeners();
  }
  //calculation of 80GGA

  final TextEditingController _text80GGA = TextEditingController();
  TextEditingController get text80GGA => _text80GGA;

  double _GGA80 = 0.0;
  double get GGA100 => _GGA80;

  void set80GGA() {
    double amount80GGA = double.tryParse(_text80GGA.text) ?? 0;
    _GGA80 = amount80GGA;
    notifyListeners();
  }

  //calculation of 80GGC

  final TextEditingController _text80GGC = TextEditingController();
  TextEditingController get text80GGC => _text80GGC;

  double _GGC80 = 0.0;
  double get GGC100 => _GGC80;

  void set80GGC() {
    double amount80GGC = double.tryParse(_text80GGC.text) ?? 0;
    _GGC80 = amount80GGC;
    notifyListeners();
  }
  //calculation of other Examptions

  final TextEditingController _textOtherExp = TextEditingController();
  TextEditingController get textOtherExp => _textOtherExp;

  double _OtherExp = 0.0;
  double get OhterExp => _OtherExp;

  void setOtherExp() {
    double amountOtherExp = double.tryParse(_textOtherExp.text) ?? 0;
    _OtherExp = amountOtherExp;
    notifyListeners();
  }

  //Calculation of 80TTA
  final TextEditingController _text80TTA = TextEditingController();
  TextEditingController get text80TTA => _text80TTA;

  double _TTA80 = 0.0;
  double get TTA80 => _TTA80;

  void set80TTA() {
    double amount80TTA = double.tryParse(_text80TTA.text) ?? 0;
    if (amount80TTA <= 10000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _TTA80 = amount80TTA;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _TTA80 = 10000;
    }
    notifyListeners();
  }

  //Calculation of 80TTB
  final TextEditingController _text80TTB = TextEditingController();
  TextEditingController get text80TTB => _text80TTB;

  double _TTB80 = 0.0;
  double get TTB80 => _TTB80;

  void set80TTB() {
    double amount80TTB = double.tryParse(_text80TTB.text) ?? 0;
    if (amount80TTB <= 50000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _TTB80 = amount80TTB;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _TTB80 = 50000;
    }
    notifyListeners();
  }

  //calculation of 80CCD(2)

  final TextEditingController _text80CCD = TextEditingController();
  TextEditingController get text80CCD => _text80CCD;

  double _CCD80 = 0.0;
  double get cCD80 => _CCD80;

  void set80CCD() {
    double amount80CCD = double.tryParse(_text80CCD.text) ?? 0;
    _CCD80 = amount80CCD;
    notifyListeners();
  }

  //calculation of 80CCD(2)

  final TextEditingController _textStardDeduction = TextEditingController();
  TextEditingController get textStardDeduction => _textStardDeduction;

  double _StardDeduction = 0.0;
  double get StardDeduction => _StardDeduction;

  void setStardDeduction() {
    double amountStardDeduction =
        double.tryParse(_textStardDeduction.text) ?? 0;
    if (amountStardDeduction <= 50000) {
      // If the expense is less than or equal to Rs. 40,000, then the deduction amount will be equal to the expense amount
      _StardDeduction = amountStardDeduction;
    } else {
      // If the expense is more than Rs. 40,000, then the deduction amount will be capped at Rs. 1,00,000 for senior citizens and Rs. 80,000 for other taxpayers
      _StardDeduction = 50000;
    }
    notifyListeners();
  }

  double _totalExaptionDeduction = 0.0;
  double get totalExaptionDeduction => _totalExaptionDeduction;

  void SetExemptionDeductions() {
    _totalExaptionDeduction = StardDeduction +
        cCD80 +
        TTB80 +
        GGC100 +
        GGA100 +
        g100 +
        g80 +
        E80 +
        EEB80 +
        U80 +
        FoodCoupons +
        EEA80 +
        CCD80 +
        section24 +
        deductionAmount +
        visible80C +
        G80 +
        totalu80 +
        texDeduction;
    notifyListeners();
  }

  double _netamount = 0.0;
  double get netamount => _netamount;

  void SetNetamount() {
    if (totalExaptionDeduction > TotalIncone) {
      _netamount = TotalIncone - TotalIncone;
    } else {
      _netamount = TotalIncone - totalExaptionDeduction;
    }
    notifyListeners();
  }
  //calcuation of taxpayable

  double _income = 0.0;
  double _tax = 0.0;
  double _cess = 0.0;
  double _Totaltax = 0.0;

  double get income => _income;
  double get cess => _cess;
  double get Totaltax1 => _Totaltax;

  setincome() {
    _income = netamount;
    _calculateTax();
    if (netamount >= 50000) {
      _calculateCess();
    }

    _calculateTotalTax();
  }

  double get tax => _tax;

  void _calculateTax() {
    _tax = TaxModel.calculateTax(_income);

    print('tax$tax');

    notifyListeners();
  }

  void _calculateTotalTax() {
    _cess = TaxCess.calculateTax(tax);
    _Totaltax = tax + cess;
    print('proCess$cess');
    print('add$Totaltax1 ');
    notifyListeners();
  }

  void _calculateCess() {
    _Totaltax = tax + cess;

    notifyListeners();
  }

//Taxes Paid section
  //advanc& assessment tax
  final TextEditingController _textBSRcode = TextEditingController();
  final TextEditingController _textBankName = TextEditingController();
  final TextEditingController _textDate = TextEditingController();

  final TextEditingController _textChallanSr = TextEditingController();
  final TextEditingController _texttax = TextEditingController();

  TextEditingController get textBSRcode => _textBSRcode;
  TextEditingController get textBankName => _textBankName;
  TextEditingController get textDate => _textDate;
  TextEditingController get textChallanSr => _textChallanSr;
  TextEditingController get texttax => _texttax;

  String _bsrCode = '';

  String get bsrCode => _bsrCode;

  setbsrCode() {
    _bsrCode = textBSRcode.text;
    notifyListeners();
  }

  bool get isBSRCodeValid {
    if (bsrCode.isEmpty) {
      return true;
    } else {
      RegExp bsrRegex = RegExp(r'[0-9]{3}[0-9A-Z]{4}');
      return bsrRegex.hasMatch(_bsrCode);
    }
  }

  String _bankName = '';

  String get bankName => _bankName;

  void setbankName() {
    _bankName = textBankName.text;
    notifyListeners();
  }

  bool get isBankNamevalibation {
    if (bankName.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s]+$");
      return regex.hasMatch(bankName);
    }
  }
}

double calculateTaxDeduction(double amountSpent, double disabilityPercentage) {
  double deductionAmount = 0;

  if (disabilityPercentage >= 40 && disabilityPercentage < 80) {
    deductionAmount = 75000;
  } else if (disabilityPercentage >= 80) {
    deductionAmount = 125000;
  }

  return min(deductionAmount, amountSpent);
}

class From16CalExamption with ChangeNotifier {}
