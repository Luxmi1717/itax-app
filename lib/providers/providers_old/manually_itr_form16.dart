import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:itax/models/itr_taxpaid_model.dart';
import 'package:itax/models/taxpayable_form16.dart';

class ManualITRCalculation with ChangeNotifier {
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

  double _salary = 0;

  double get salary => _salary;

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

  //capital gains
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

  //other source

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

  /// TTA
  bool _TTA = true;
  bool get TTA => _TTA;

  TTAValue(val){
    _TTA = val;
    interestAccount.text = _TTA ? (double.parse(interestAccount.text) * 12).toString() : (double.parse(interestAccount.text)/12).toString();
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
    set80TTA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    settotalInterest();
    notifyListeners();
  }

  /// TTA
  bool _bbf = true;
  bool get bbf => _bbf;

  bbfValue(val){
    _bbf = val;
    business.text = _bbf ? (double.parse(business.text) * 12).toString() : (double.parse(business.text)/12).toString();
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
    set80TTA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    settotalInterest();
    notifyListeners();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
  }


  /// PPF
  bool _ppf = true;
  bool get ppf => _ppf;

  ppfValue(val){
    _ppf = val;
    profession.text = _ppf ? (double.parse(profession.text) * 12).toString() : (double.parse(profession.text)/12).toString();
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
    set80TTA();
    SetExemptionDeductions();
    SetNetamount();
    setincome();
    settotalInterest();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    settotalbusiness();
    totalIncome();
    SetNetamount();
    setincome();
    notifyListeners();
  }

  /// 80E
  bool _S2 = true;
  bool get S2 => _S2;

  S2Value(val){
    _S2 = val;
    textBasicController.text = _S2 ? (double.parse(textBasicController.text) * 12).toString() : (double.parse(textBasicController.text)/12).toString();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
  }

  bool _H2 = true;
  bool get H2 => _H2;

  H2Value(val){
    _H2 = val;
    textHRAController.text = _H2 ? (double.parse(textHRAController.text) * 12).toString() : (double.parse(textHRAController.text)/12).toString();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
  }

  bool _Bounous = true;
  bool get Bounous => _Bounous;

  BounouValue(val){
    _Bounous = val;
    textbonusController.text = _Bounous ? (double.parse(textbonusController.text) * 12).toString() : (double.parse(textbonusController.text)/12).toString();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
  }


  bool _Allowances = true;
  bool get Allowances => _Allowances;

  AllowancesValue(val){
    _Allowances = val;
    salaryother.text = _Allowances ? (double.parse(salaryother.text) * 12).toString() : (double.parse(salaryother.text)/12).toString();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
    salarytotal();
    totalIncome();
    SetNetamount();
    setincome();
  }

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
    double amount80TTA = double.tryParse(_interestAccount.text) ?? 0;

    if (amount80TTA <= 10000) {
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
        TTA80 +
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

  //TDS Paid Section
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

//all Manully itr section TaxPaid provider define here

class ManuallyITRTaxPaid with ChangeNotifier {
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

// Salary

//here difine all validation part of tax paid

  //BSR Code validatior

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

  // BANK Name Validatior

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

// data validator
  String _dateadvance = '';

  String get dateadvance => _dateadvance;

  void setdata() {
    _dateadvance = _textDate.text;
    notifyListeners();
  }

  bool get isdatavalibation {
    if (dateadvance.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
      return regex.hasMatch(dateadvance);
    }
  }

// tax paid challan No serial no
  String _challanNo = '';

  String get challanNo => _challanNo;

  void setchallanNo() {
    _challanNo = _textChallanSr.text;
    notifyListeners();
  }

  bool get isCallanNovalibation {
    if (challanNo.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^\d{5}$');
      return regex.hasMatch(challanNo);
    }
  }
  // tax paid tcs tan number

  String formITR1Value = '';
  String personalInfoValue = '';
  List<Map<String, String>> taxPaidRecords = [];

  void updateFormITR1Value(String value) {
    formITR1Value = value;
    notifyListeners();
  }

  void updatePersonalInfoValue(String value) {
    personalInfoValue = value;
    notifyListeners();
  }

  void addTaxPaidRecord() {
    taxPaidRecords.add({});
    notifyListeners();
  }

  void updateTaxPaidField(int index, String field, String value) {
    if (index >= 0 && index < taxPaidRecords.length) {
      Map<String, String> taxPaidRecord = taxPaidRecords[index];
      taxPaidRecord[field] = value;
      notifyListeners();
    }
  }

  final List<Model_of_record_details> _dataList = [];

  List<Model_of_record_details> get dataList => _dataList;

  int _totalAdvanceTax = 0;
  int _totalSelfAssessmentTax = 0;

  int get totalAdvanceTax => _totalAdvanceTax;
  int get totalSelfAssessmentTax => _totalSelfAssessmentTax;
  int _totalAmount = 0;
  int get totalamount => _totalAmount;

  void addRecord(Model_of_record_details record) {
    _dataList.add(record);
    convertDataListToJson();
    notifyListeners();
  }

  List<Map<String, dynamic>> convertDataListToJson() {
    List<Map<String, dynamic>> jsonList = _dataList.map((record) {
      return {
        'BSRCode': record.bsrcode,
        'DateDep': record.data,
        'SrlNoOfChaln': record.challanSr,
        'Amt': record.tax,
      };
    }).toList();

    int currentYear = DateTime.now().year;

    for (var record in jsonList) {
      int amount = int.parse(record['Amt'] as String? ?? '0');

      // Get the year from the DateDep field
      String dateDepString = record['DateDep'] as String? ?? '';

      // Parse the date in the format "dd/MM/yyyy"
      DateTime dateDep = DateTime.parse(
          DateFormat('dd/MM/yyyy').parse(dateDepString).toString());

      if (dateDep.isBefore(DateTime(currentYear, 3, 31))) {
        _totalAdvanceTax += amount;
      } else {
        _totalSelfAssessmentTax += amount;
      }
    }
    int totalAmount = jsonList.fold<int>(
        0,
        (sum, record) =>
            sum + int.parse(record['AmtForTaxDeduct'] as String? ?? '0'));
    _totalAmount = totalAmount;

    return jsonList;
  }
}

class ItrManuallyTCSDetails extends ChangeNotifier {
  //TCS Details

  final TextEditingController _TCSTanNumber = TextEditingController();
  final TextEditingController _TCSDeducted = TextEditingController();
  final TextEditingController _TCSPurchesesAssets = TextEditingController();

  final TextEditingController _TCSTaxDeducted = TextEditingController();

  TextEditingController get TCSTanNumber => _TCSTanNumber;

  TextEditingController get TCSDeducted => _TCSDeducted;

  TextEditingController get TCSPurchesesAssets => _TCSPurchesesAssets;

  TextEditingController get TCSTaxDeducted => _TCSTaxDeducted;

// tax paid tcs tan number
  String _TanNumber = '';

  String get TanNumber => _TanNumber;

  void setTanNumber() {
    _TanNumber = TCSTanNumber.text;
    notifyListeners();
  }

  bool get isTanNumbervalibation {
    if (TanNumber.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^[A-Z]{4}\d{5}[A-Z]{1}$');
      return regex.hasMatch(TanNumber);
    }
  }

  // tax paid tcs tan number
  String _Deducted = '';

  String get Deducted => _Deducted;

  void setDeducted() {
    _Deducted = TCSDeducted.text;
    notifyListeners();
  }

  bool get isDeductedvalibation {
    if (Deducted.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^[A-Za-z\s]+$');
      return regex.hasMatch(Deducted);
    }
  }

  final List<TCSDetails_record_details> _dataList = [];

  List<TCSDetails_record_details> get dataList => _dataList;
  int _totalAmount = 0;
  int get totalamount => _totalAmount;

  void addRecord(TCSDetails_record_details record) {
    _dataList.add(record);
    notifyListeners();
  }

  void getTotalTaxDeducted() {
    for (var record in _dataList) {
      int taxDeducted = int.tryParse(record.totalTaxDeducted) ?? 0;
      _totalAmount += taxDeducted;
    }
    notifyListeners();
  }
}

class itrManuallyTDSNonSalary extends ChangeNotifier {
  final TextEditingController _NonSalaryHeadofIncome = TextEditingController();
  final TextEditingController _NonSalaryName = TextEditingController();
  final TextEditingController _NonSalartanPan = TextEditingController();

  final TextEditingController _NonSalaryAmountPaid = TextEditingController();
  final TextEditingController _NonSalaryPaymentCredite =
      TextEditingController();
  final TextEditingController _NonSalaryPaidCreditedIncome =
      TextEditingController();
  final TextEditingController _NonSalarCertificateNumber =
      TextEditingController();

  final TextEditingController _NonSalaryCertificateNumber9 =
      TextEditingController();
  final TextEditingController _NonSalaryTDSDeducted = TextEditingController();
  final TextEditingController _NonSalaryHandOfSpouser = TextEditingController();

  final TextEditingController _NonSalarDeductionIncluSurcharge =
      TextEditingController();
  final TextEditingController _NonSalaryuniqueCertificateNumber =
      TextEditingController();

  TextEditingController get NonSalaryHeadofIncome => _NonSalaryHeadofIncome;

  TextEditingController get NonSalarDeductionIncluSurcharge =>
      _NonSalarDeductionIncluSurcharge;

  TextEditingController get NonSalaryName => _NonSalaryName;

  TextEditingController get NonSalartanPan => _NonSalartanPan;

  TextEditingController get NonSalaryAmountPaid => _NonSalaryAmountPaid;

  TextEditingController get NonSalaryPaymentCredite => _NonSalaryPaymentCredite;

  TextEditingController get NonSalaryPaidCreditedIncome =>
      _NonSalaryPaidCreditedIncome;

  TextEditingController get NonSalarCertificateNumber =>
      _NonSalarCertificateNumber;

  TextEditingController get NonSalaryCertificateNumber9 =>
      _NonSalaryCertificateNumber9;

  TextEditingController get NonSalaryTDSDeducted => _NonSalaryTDSDeducted;

  TextEditingController get NonSalaryHandOfSpouser => _NonSalaryHandOfSpouser;

  TextEditingController get NonSalaryuniqueCertificateNumber =>
      _NonSalaryuniqueCertificateNumber;

  String _dateNonSalary = '';

  String get dateNonSalary => _dateNonSalary;

  void setdateNonSalary() {
    _dateNonSalary = NonSalaryPaymentCredite.text;
    notifyListeners();
  }

  bool get isdateNonSalaryvalibation {
    if (dateNonSalary.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
      return regex.hasMatch(dateNonSalary);
    }
  }

  String _NonSalaryTan = '';

  String get NonSalaryTan => _NonSalaryTan;

  void setNonSalaryTan() {
    _NonSalaryTan = NonSalartanPan.text;
    notifyListeners();
  }

  bool get isNonSalaryvalibationTan {
    if (NonSalaryTan.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^[A-Z]{4}\d{5}[A-Z]{1}$');
      return regex.hasMatch(NonSalaryTan);
    }
  }

  final List<TDSDetails_record_details> _dataList = [];

  List<TDSDetails_record_details> get dataList => _dataList;

  int _totalAmount = 0;
  int get totalamount => _totalAmount;

  void addRecord(TDSDetails_record_details record) {
    _dataList.add(record);
    convertDataListToJson();
    notifyListeners();
  }

  List<Map<String, dynamic>> convertDataListToJson() {
    List<Map<String, dynamic>> jsonList = _dataList.map((record) {
      return {
        "EmployerOrDeductorOrCollectDetl": {
          "TAN": record.TanPan,
          "EmployerOrDeductorOrCollecterName": record.Name,
        },
        "AmtForTaxDeduct": record.AmountPaidCredited,
        "DeductedYr": record.DataofPayment,
        "TotTDSOnAmtPaid": record.TaxDeductionIncluSurcharge,
        "ClaimOutOfTotTDSOnAmtPaid": record.AmountPaidCreditedIncome,
      };
    }).toList();

    int totalAmount = jsonList.fold<int>(
        0,
        (sum, record) =>
            sum + int.parse(record['AmtForTaxDeduct'] as String? ?? '0'));

    String totalAmountString = totalAmount.toString();
    _totalAmount = totalAmount;

    return jsonList;
  }
}

class itrManuallyTDSonSalary extends ChangeNotifier {
  final TextEditingController _SalaryTan = TextEditingController();
  final TextEditingController _SalaryNameDeducted = TextEditingController();
  final TextEditingController _SalartanPurchasesofAsserts =
      TextEditingController();

  final TextEditingController _SalaryTotalTaxDuducted = TextEditingController();

  TextEditingController get SalaryTan => _SalaryTan;

  TextEditingController get SalaryNameDeducted => _SalaryNameDeducted;

  TextEditingController get SalartanPurchasesofAsserts =>
      _SalartanPurchasesofAsserts;

  TextEditingController get SalaryTotalTaxDuducted => _SalaryTotalTaxDuducted;

  final List<TDSOnSalaryDetails_record_details> _dataList = [];

  List<TDSOnSalaryDetails_record_details> get dataList => _dataList;

  int _totalAmount = 0;
  int get totalamount => _totalAmount;

  void addRecord(TDSOnSalaryDetails_record_details record) {
    _dataList.add(record);

    convertDataListToJson();
    notifyListeners();
  }

  List<Map<String, dynamic>> convertDataListToJson() {
    List<Map<String, dynamic>> jsonList = _dataList.map((record) {
      return {
        "EmployerOrDeductorOrCollectDetl": {
          "TAN": record.tanNumber,
          "EmployerOrDeductorOrCollecterName": record.Namededucted
        },
        "IncChrgSal": record.IcomeChargeable,
        "TotalTDSSal": record.totalTaxDeducted
      };
    }).toList();

    int totalAmount = jsonList.fold<int>(
        0,
        (sum, record) =>
            sum + int.parse(record['TotalTDSSal'] as String? ?? '0'));

    String totalAmountString = totalAmount.toString();
    _totalAmount = totalAmount;
    return jsonList;
  }
}

class itrManuallyProfileSection extends ChangeNotifier {
  final TextEditingController _assessmentYearController =
      TextEditingController();
  final TextEditingController _financialYearController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _MiddleNameController = TextEditingController();
  final TextEditingController _SerNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _residenceController = TextEditingController();

  final TextEditingController _panNumberController = TextEditingController();
  final TextEditingController _dateOfFillingController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _adharCardController = TextEditingController();

  //address option

  final TextEditingController _flatNoController = TextEditingController();
  final TextEditingController _BuilddingNoController = TextEditingController();
  final TextEditingController _BuildingNameController = TextEditingController();
  final TextEditingController _StreetController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _PancodeController = TextEditingController();
  //address option

  final TextEditingController _bankAccountController = TextEditingController();
  final TextEditingController _IfscCodeController = TextEditingController();
  final TextEditingController _BankNameController = TextEditingController();

  TextEditingController get flatNoController => _flatNoController;

  TextEditingController get BuilddingNoController => _BuilddingNoController;

  TextEditingController get BuildingNameController => _BuildingNameController;

  TextEditingController get StreetController => _StreetController;

  TextEditingController get areaController => _areaController;

  TextEditingController get cityController => _cityController;

  TextEditingController get districtController => _districtController;
  TextEditingController get PancodeController => _PancodeController;

  //not address

  TextEditingController get assessmentYearController =>
      _assessmentYearController;

  TextEditingController get financialYearController => _financialYearController;

  TextEditingController get nameController => _nameController;

  TextEditingController get fatherNameController => _fatherNameController;

  TextEditingController get dobController => _dobController;

  TextEditingController get residenceController => _residenceController;

  TextEditingController get panNumberController => _panNumberController;
  TextEditingController get SerNameController => _SerNameController;

  TextEditingController get dateOfFillingController => _dateOfFillingController;
  TextEditingController get MiddleNameController => _MiddleNameController;

  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get gmailController => _gmailController;
  TextEditingController get adharCardController => _adharCardController;

  TextEditingController get bankAccountController => _bankAccountController;
  TextEditingController get IfscCodeController => _IfscCodeController;
  TextEditingController get BankNameController => _BankNameController;

  String _dataofbirth = '';
  String get dataofbirth => _dataofbirth;
  String _selectGender = '';
  String get selectGender => _selectGender;
  String _selectResidence = '';
  String get selectResidence => _selectResidence;
  String _assessmentYear = '';
  String get assessmentYear => _assessmentYear;
  String _financialYear = '';
  String get financialYear => _financialYear;
  String _countryCode = '';
  String get countryCode => _countryCode;
  String _SelectedState = '';
  String get SelectedState => _SelectedState;

  String _employeStatus = '';
  String get employeStatus => _employeStatus;

  void updatedataofbirth(String value) {
    _dataofbirth = value;
    notifyListeners();
  }

  void updateAssessmentYear(String value) {
    _assessmentYear = value;
    notifyListeners();
  }

  void updateFinancialYear(String value) {
    _financialYear = value;
    notifyListeners();
  }

  // Implement similar update methods for other fields

  void updateSelectGender(String value) {
    _selectGender = value;
    notifyListeners();
  }

  void updateSelectResidence(String value) {
    _selectResidence = value;
    notifyListeners();
  }

  void updateCountryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  void updateStateCode(String value) {
    _SelectedState = value;
    notifyListeners();
  }

  void updateemployeStatus(String value) {
    _employeStatus = value;
    notifyListeners();
  }

  //validataor
// data validator
  String _dateoffilling = '';

  String get dateofFilling => _dateoffilling;

  void setdata() {
    _dateoffilling = _dateOfFillingController.text;
    notifyListeners();
  }

  bool get isdatavalibation {
    if (dateofFilling.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^\d{4}-\d{2}-\d{2}$");
      return regex.hasMatch(dateofFilling);
    }
  }

  String _Name = '';

  String get Name => _Name;

  void setName() {
    _Name = nameController.text;
    notifyListeners();
  }

  bool get isNamevalibation {
    if (Name.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s]+$");
      return regex.hasMatch(Name);
    }
  }

  String _MiddleName = '';

  String get MiddleName => _MiddleName;

  void setMiddleName() {
    _MiddleName = MiddleNameController.text;
    notifyListeners();
  }

  bool get isMiddleNamevalibation {
    if (MiddleName.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s]+$");
      return regex.hasMatch(MiddleName);
    }
  }

  String _serName = '';

  String get serName => _serName;

  void setSerName() {
    _serName = SerNameController.text;
    notifyListeners();
  }

  bool get isSerNamevalibation {
    if (serName.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s]+$");
      return regex.hasMatch(serName);
    }
  }

  String _FatherName = '';

  String get FatherName => _FatherName;

  void setFatherName() {
    _FatherName = fatherNameController.text;
    notifyListeners();
  }

  bool get isFathervalibation {
    if (FatherName.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s]+$");
      return regex.hasMatch(FatherName);
    }
  }

  String _Residance = '';

  String get Residance => _Residance;

  void setResidanceName() {
    _Residance = fatherNameController.text;
    notifyListeners();
  }

  bool get isResidancevalibation {
    if (Residance.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s]+$");
      return regex.hasMatch(Residance);
    }
  }

  String _PANnumber = '';

  String get PANnumber => _PANnumber;

  void setPANnumberName() {
    _PANnumber = panNumberController.text;
    notifyListeners();
  }

  bool get isPanNumbervalibation {
    if (PANnumber.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');
      return regex.hasMatch(PANnumber);
    }
  }

  String _bank = '';

  String get bank => _bank;

  void setbank() {
    _bank = bankAccountController.text;
    notifyListeners();
  }

  bool get isBankvalibation {
    if (bank.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r'^[0-9]{6,}$');
      return regex.hasMatch(bank);
    }
  }

  String _BankName = '';

  String get BankName => _BankName;

  void setBankName() {
    _BankName = BankNameController.text;
    notifyListeners();
  }

  bool get isBankNamevalibation {
    if (BankName.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s]+$");
      return regex.hasMatch(BankName);
    }
  }

  String _IFSCCode = '';

  String get IFSCCode => _IFSCCode;

  void setIFSCCode() {
    _IFSCCode = IfscCodeController.text;
    notifyListeners();
  }

  bool get isIFSCCodevalibation {
    if (IFSCCode.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Z]{4}0[A-Z0-9]{6}$");
      return regex.hasMatch(IFSCCode);
    }
  }

  String _AdharCard = '';

  String get AdharCard => _AdharCard;

  void setAdharCard() {
    _AdharCard = adharCardController.text;
    notifyListeners();
  }

  bool get isAdharCardvalibation {
    if (AdharCard.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^\d{12}$");
      return regex.hasMatch(AdharCard);
    }
  }

  //data of birth
  String _dateofbrith = '';

  String get dateofbrith => _dateofbrith;

  void set_dateofbrith() {
    _dateofbrith = dobController.text;
    notifyListeners();
  }

  bool get isdateofbrith {
    if (dateofbrith.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^\d{4}-\d{2}-\d{2}$");
      return regex.hasMatch(dateofbrith);
    }
  }

  String _district = '';

  String get district => _district;

  void setdistrict() {
    _district = districtController.text;
    notifyListeners();
  }

  bool get isdistrict {
    if (district.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[A-Za-z\s-]+$");
      return regex.hasMatch(district);
    }
  }

  String _phoneNumer = '';

  String get phoneNumer => _phoneNumer;

  void setphoneNumer() {
    _phoneNumer = phoneNumberController.text;
    notifyListeners();
  }

  bool get isphoneNumer {
    if (phoneNumer.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^\d{3}[\s.-]?\d{3}[\s.-]?\d{4}$");
      return regex.hasMatch(phoneNumer);
    }
  }

  String _gmail = '';
  String get gmail => _gmail;
  void setgmail() {
    _gmail = gmailController.text;
    notifyListeners();
  }

  bool get isgmail {
    if (gmail.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
      return regex.hasMatch(gmail);
    }
  }

  String _Pincode = '';

  String get Pincode => _Pincode;

  void setPincode() {
    _Pincode = PancodeController.text;
    notifyListeners();
  }

  bool get isPincode {
    if (Pincode.isEmpty) {
      return true;
    } else {
      RegExp regex = RegExp(r"^\d{6}$");
      return regex.hasMatch(Pincode);
    }
  }
}

class itrManullyRefandSection extends ChangeNotifier {
  final ManuallyITRTaxPaid advanceAsssTax;
  itrManullyRefandSection(this.advanceAsssTax);
  void doSomethingWithProviderA() {
    print('Provider A value: ${advanceAsssTax.totalAdvanceTax.toString()}');
    notifyListeners();
  }
}
