
import 'package:itax/utility/date_time.dart';

class ITRModel {
  double grossSalaryTotal;
  double salaryAsPerProvisions;
  double valueOfPerquisites;
  double profitsInLieuOfSalary;
  double houseRentAllowance;
  double totalAmountOfSalaryReceived;
  double totalAmountOfDeductions;
  double standardDeduction;
  double taxOnEmployment;
  double incomeChargableUnderSalaries;
  double deductionsOnInterestLoanForHigherEducationGrossAmount;
  double deductionsOnInterestLoanForHigherEducationDeductibleAmount;
  double incomeFromHousePropertyReported;
  double incomeUnderOtherSources;
  double grossTotalIncome;
  double deductionsOnLifeInsurancePremiums;
  double deductionsOnPensionFunds;
  double deductionsOnNotifiedPensionScheme;
  double deductionsByEmployerToPensionScheme;
  double deductionsOnHealthInsurancePremiums;
  double deductionsOnDonationsToCharitableInstitutions;
  double deductionsOnInterestOnSavingsAccount;
  double aggregateOfDeductibleAmount;
  double totalTaxableIncome;
  double totalAmountOfOtherIncomeReportedByTheEmployee;
  double totalAmountOfTaxDepositedOrRemitted;
  double netTaxPayable;
  double rebateUnderSection87A;
  double healthAndEducationCess;
  double qualifyingAmountOfDonations;
  String verificationFullName;
  String partBPanOfEmployee;
  String nameAndAddressOfEmployee;
  String partAAssessmentYear;

  ITRModel({
    required this.grossSalaryTotal,
    required this.salaryAsPerProvisions,
    required this.valueOfPerquisites,
    required this.profitsInLieuOfSalary,
    required this.houseRentAllowance,
    required this.totalAmountOfSalaryReceived,
    required this.totalAmountOfDeductions,
    required this.standardDeduction,
    required this.taxOnEmployment,
    required this.incomeChargableUnderSalaries,
    required this.deductionsOnInterestLoanForHigherEducationGrossAmount,
    required this.deductionsOnInterestLoanForHigherEducationDeductibleAmount,
    required this.incomeFromHousePropertyReported,
    required this.incomeUnderOtherSources,
    required this.grossTotalIncome,
    required this.deductionsOnLifeInsurancePremiums,
    required this.deductionsOnPensionFunds,
    required this.deductionsOnNotifiedPensionScheme,
    required this.deductionsByEmployerToPensionScheme,
    required this.deductionsOnHealthInsurancePremiums,
    required this.deductionsOnDonationsToCharitableInstitutions,
    required this.deductionsOnInterestOnSavingsAccount,
    required this.aggregateOfDeductibleAmount,
    required this.totalAmountOfOtherIncomeReportedByTheEmployee,
    required this.totalTaxableIncome,
    required this.netTaxPayable,
    required this.rebateUnderSection87A,
    required this.totalAmountOfTaxDepositedOrRemitted, // TOTAL AMOUNT OF TAX DEPOSITED/REMITTED
    required this.healthAndEducationCess,
    required this.qualifyingAmountOfDonations,
    required this.verificationFullName,
    required this.partBPanOfEmployee,
    required this.nameAndAddressOfEmployee,
    required this.partAAssessmentYear,
  });

  factory ITRModel.fromJSON(Map<String, dynamic> json) {
    final data = json['data'];

    return ITRModel(
      grossSalaryTotal: double.parse(data['GROSS SALARY (d) TOTAL'] ?? '0.00'),
      salaryAsPerProvisions: double.parse(
          data['SALARY AS PER PROVISIONS CONTAINED IN SECTION 17(1)'] ??
              '0.00'),
      valueOfPerquisites: double.parse(data[
              'VALUE OF PERQUISITES UNDER SECTION 17(2)(AS PER FORM NO 12BA, WHEREVER APPLICABLE'] ??
          '0.00'),
      profitsInLieuOfSalary: double.parse(data[
              'PROFITS IN LIEU OF SALARY UNDER SECTION 17(3)(AS PER FORM NO 12BA, WHEREVER APPLICABLE'] ??
          '0.00'),
      houseRentAllowance: double.parse(
          data['HOUSE RENT ALLOWANCE UNDER SECTION 10(13A)'] ?? '0.00'),
      totalAmountOfSalaryReceived: double.parse(
          data['TOTAL AMOUNT OF SALARY RECEIVED FROM CURRENT EMPLOYER'] ??
              '0.00'),
      totalAmountOfDeductions: double.parse(
          data['TOTAL AMOUNT OF DEDUCTIONS UNDER SECTION 16'] ?? '0.00'),
      standardDeduction: double.parse(
          data['STANDAR DEDUCTION UNDER SECTION 16(ia)'] ?? '0.00'),
      taxOnEmployment: double.parse(
          data['TAX ON EMPLOYEMENT UNDER SECTION 16(iii)'] ?? '0.00'),
      incomeChargableUnderSalaries: double.parse(
          data['INCOME CHARGABLE UNDER THE HEAD "SALARIES"'] ?? '0.00'),
      deductionsOnInterestLoanForHigherEducationGrossAmount: double.parse(data[
              'DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E GROSS AMOUNT'] ??
          '0.00'),
      deductionsOnInterestLoanForHigherEducationDeductibleAmount: double.parse(
          data['DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E DEDUCTIBLE AMOUNT'] ??
              '0.00'),
      incomeFromHousePropertyReported: double.parse(data[
              'INCOME (OR ADMISSIBLE LOSS) FROM HOUSE PROPERTY REPORTED BY EMPLOYEE OFFERED FOR TDS'] ??
          '0.00'),
      incomeUnderOtherSources: double.parse(
          data['INCOME UNDER THE HEAD OTHER SOURCES OFFERED FOR TDS'] ??
              '0.00'),
      grossTotalIncome: double.parse(data['GROSS TOTAL INCOME'] ?? '0.00'),
      deductionsOnLifeInsurancePremiums: double.parse(data[
              'DEDUCTIONS IN RESPECT OF LIFE INSURANCE PREMIA, CONTRIBUTIONS TO PF, ETC UNDER SECTION 80C DEDUCTIBLE AMOUNT'] ??
          '0.00'),
      deductionsOnPensionFunds: double.parse(data[
              'DEDUCTIONS IN RESPECT OF CONTRIBUTION TO CERTAIN PENSION FUNDS UNDER SECTION 80CCC DEDUCTIBLE AMOUNT'] ??
          '0.00'),
      deductionsOnNotifiedPensionScheme: double.parse(data[
              'DEDUCTIONS IN RESPECT OF AMOUNT PAID/DEPOSITED TO NOTIFIED PENSION SCHEME UNDER 80CCD(1B) DEDUCTIBLE AMOUNT'] ??
          '0.00'),
      deductionsByEmployerToPensionScheme: double.parse(data[
              'DEDUCTIONS IN RESPECT OF CONTRIBUTION BY THE EMPLOYER TO PENSION SCHEME UNDER SECTION 80CCD(2) DEDUCTIBLE AMOUNT'] ??
          '0.00'),
      deductionsOnHealthInsurancePremiums: double.parse(data[
              'DEDUCTIONS IN RESPECT OF HEALTH INSURANCE PREMIA UNDER SECTION 80D DEDUCTIBLE AMOUNT'] ??
          '0.00'),
      deductionsOnDonationsToCharitableInstitutions: double.parse(data[
              'TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G DEDUCTIBLE AMOUNT'] ??
          '0.00'),
      deductionsOnInterestOnSavingsAccount: double.parse(data[
              'DEDUCTION IN RESPECT OF INTEREST ON DEPOSITS IN SAVINGS ACCOUNT UNDER SECTION 80TTA DEDUCTIBLE AMOUNT'] ??
          '0.00'),
      aggregateOfDeductibleAmount: double.parse(
          data['AGGREGATE OF DEDUCTIBLE AMOUNT UNDER CHAPTER VI-A'] ?? '0.00'),
      totalAmountOfOtherIncomeReportedByTheEmployee: double.parse(
          data['TOTAL AMOUNT OF OTHER INCOME REPORTED BY THE EMPLOYEE'] ??
              '0.00'),
      totalTaxableIncome: double.parse(data['TOTAL TAXABLE INCOME'] ?? '0.00'),
      totalAmountOfTaxDepositedOrRemitted: double.parse(
          data['TOTAL AMOUNT OF TAX DEPOSITED/REMITTED'] ?? '0.00'),
      netTaxPayable: double.parse(data['NET TAX PAYABLE'] ?? '0.00'),
      rebateUnderSection87A: double.parse(
          data['REBATE UNDER SECTION 87A, IF APPLICABLE'] ?? '0.00'),
      healthAndEducationCess:
          double.parse(data['HEALTH AND EDUCATION CESS'] ?? '0.00'),
      qualifyingAmountOfDonations: double.parse(data[
              'TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G QUALIFYING AMOUNT'] ??
          '0.00'),
      verificationFullName: data['VERIFICATION FULL NAME'] ?? '',
      partBPanOfEmployee: data['PART B Pan of Employee'] ?? '',
      nameAndAddressOfEmployee:
          data['PART B Name and Address of Employee'] ?? '',
      partAAssessmentYear: data['PART A Assessment Year'] != null
          ? DateTimeUtil.processAssessmentYear(data['PART A Assessment Year'])
          : '2022-23',
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'GROSS SALARY (d) TOTAL': grossSalaryTotal.toString(),
      'SALARY AS PER PROVISIONS CONTAINED IN SECTION 17(1)':
          salaryAsPerProvisions.toString(),
      'VALUE OF PERQUISITES UNDER SECTION 17(2)(AS PER FORM NO 12BA, WHEREVER APPLICABLE':
          valueOfPerquisites.toString(),
      'PROFITS IN LIEU OF SALARY UNDER SECTION 17(3)(AS PER FORM NO 12BA, WHEREVER APPLICABLE':
          profitsInLieuOfSalary.toString(),
      'HOUSE RENT ALLOWANCE UNDER SECTION 10(13A)':
          houseRentAllowance.toString(),
      'TOTAL AMOUNT OF SALARY RECEIVED FROM CURRENT EMPLOYER':
          totalAmountOfSalaryReceived.toString(),
      'TOTAL AMOUNT OF DEDUCTIONS UNDER SECTION 16':
          totalAmountOfDeductions.toString(),
      'STANDAR DEDUCTION UNDER SECTION 16(ia)': standardDeduction.toString(),
      'TAX ON EMPLOYEMENT UNDER SECTION 16(iii)': taxOnEmployment.toString(),
      'INCOME CHARGABLE UNDER THE HEAD "SALARIES"':
          incomeChargableUnderSalaries.toString(),
      'DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E GROSS AMOUNT':
          deductionsOnInterestLoanForHigherEducationGrossAmount.toString(),
      'DEDUCTIONS IN RESPECT OF INTEREST ON LOAN TAKEN FOR HIGHER EDUCATION UNDER SECTION 80E DEDUCTIBLE AMOUNT':
          deductionsOnInterestLoanForHigherEducationDeductibleAmount.toString(),
      'INCOME (OR ADMISSIBLE LOSS) FROM HOUSE PROPERTY REPORTED BY EMPLOYEE OFFERED FOR TDS':
          incomeFromHousePropertyReported.toString(),
      'INCOME UNDER THE HEAD OTHER SOURCES OFFERED FOR TDS':
          incomeUnderOtherSources.toString(),
      'GROSS TOTAL INCOME': grossTotalIncome.toString(),
      'DEDUCTIONS IN RESPECT OF LIFE INSURANCE PREMIA, CONTRIBUTIONS TO PF, ETC UNDER SECTION 80C DEDUCTIBLE AMOUNT':
          deductionsOnLifeInsurancePremiums.toString(),
      'DEDUCTIONS IN RESPECT OF CONTRIBUTION TO CERTAIN PENSION FUNDS UNDER SECTION 80CCC DEDUCTIBLE AMOUNT':
          deductionsOnPensionFunds.toString(),
      'DEDUCTIONS IN RESPECT OF AMOUNT PAID/DEPOSITED TO NOTIFIED PENSION SCHEME UNDER 80CCD(1B) DEDUCTIBLE AMOUNT':
          deductionsOnNotifiedPensionScheme.toString(),
      'DEDUCTIONS IN RESPECT OF CONTRIBUTION BY THE EMPLOYER TO PENSION SCHEME UNDER SECTION 80CCD(2) DEDUCTIBLE AMOUNT':
          deductionsByEmployerToPensionScheme.toString(),
      'DEDUCTIONS IN RESPECT OF HEALTH INSURANCE PREMIA UNDER SECTION 80D DEDUCTIBLE AMOUNT':
          deductionsOnHealthInsurancePremiums.toString(),
      'TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G DEDUCTIBLE AMOUNT':
          deductionsOnDonationsToCharitableInstitutions.toString(),
      'DEDUCTION IN RESPECT OF INTEREST ON DEPOSITS IN SAVINGS ACCOUNT UNDER SECTION 80TTA DEDUCTIBLE AMOUNT':
          deductionsOnInterestOnSavingsAccount.toString(),
      'AGGREGATE OF DEDUCTIBLE AMOUNT UNDER CHAPTER VI-A':
          aggregateOfDeductibleAmount.toString(),
      'TOTAL TAXABLE INCOME': totalTaxableIncome.toString(),
      'TOTAL AMOUNT OF OTHER INCOME REPORTED BY THE EMPLOYEE':
          totalAmountOfOtherIncomeReportedByTheEmployee.toString(),
      'NET TAX PAYABLE': netTaxPayable.toString(),
      'REBATE UNDER SECTION 87A, IF APPLICABLE':
          rebateUnderSection87A.toString(),
      'HEALTH AND EDUCATION CESS': healthAndEducationCess.toString(),
      'TOTAL DEDUCTIONS IN RESPECT OF DONATIONS TO CERTAIN FUNDS, CHARITABLE INSTITUTIONS UNDER SECTION 80G QUALIFYING AMOUNT':
          qualifyingAmountOfDonations.toString(),
      'TOTAL AMOUNT OF TAX DEPOSITED/REMITTED':
          totalAmountOfTaxDepositedOrRemitted.toString(),
      'VERIFICATION FULL NAME': verificationFullName,
      'PART B Pan of Employee': partBPanOfEmployee,
      'PART B Name and Address of Employee': nameAndAddressOfEmployee,
      'PART A Assessment Year': partAAssessmentYear,
    };
  }
}
