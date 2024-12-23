import 'dart:math';

enum AgeCategory {
  below60,
  between60and80,
  above80,
}

class IncomeTaxCalcResult {
  final double totalIncome;
  final double exemptAllowances;
  final double standardDeduction;
  final double chapterVIADeductions;
  final double taxableIncome;
  final double incomeTax;
  final double healthAndEducationCess;
  final double totalTax;

  IncomeTaxCalcResult(
      {required this.totalIncome,
      required this.exemptAllowances,
      required this.standardDeduction,
      required this.chapterVIADeductions,
      required this.taxableIncome,
      required this.incomeTax,
      required this.healthAndEducationCess,
      required this.totalTax});
}

IncomeTaxCalcResult calculateIncomeTax({
  required double salaryIncome,
  required double exemptAllowances,
  required double interestIncome,
  required double homeLoanInterestSelfOccupied,
  required double rentalIncome,
  required double homeLoanInterestLetOut,
  required double digitalAssetIncome,
  required double otherIncome,
  required double deduction80C,
  required double deduction80TTA,
  required double deduction80D,
  required double deduction80G,
  required double deduction80E,
  required double deduction80EEA,
  required double deduction80CCD,
  required AgeCategory ageCategory,
  required String financialYear,
}) {
  double totalIncome = salaryIncome +
      interestIncome +
      homeLoanInterestSelfOccupied +
      rentalIncome +
      homeLoanInterestLetOut +
      digitalAssetIncome +
      otherIncome;

  double exemptAllowancesFinal = 0.0;
  double standardDeductionFinal = 0.0;
  double chapterVIADeductions = deduction80C +
      deduction80TTA +
      deduction80D +
      deduction80G +
      deduction80E +
      deduction80EEA +
      deduction80CCD;

  // Check if deduction limit is exceeded and set the value accordingly
  if (deduction80C > 150000) {
    deduction80C = 150000;
  }
  if (deduction80D > 50000) {
    deduction80D = 50000;
  }
  if (deduction80G > totalIncome) {
    deduction80G = totalIncome;
  }
  if (deduction80E > totalIncome) {
    deduction80E = totalIncome;
  }
  if (deduction80EEA > 150000) {
    deduction80EEA = 150000;
  }
  if (deduction80CCD > min(75000, totalIncome * 0.1)) {
    deduction80CCD = min(75000, totalIncome * 0.1);
  }

  chapterVIADeductions = deduction80C +
      deduction80TTA +
      deduction80D +
      deduction80G +
      deduction80E +
      deduction80EEA +
      deduction80CCD;

  if (ageCategory == AgeCategory.above80) {
    exemptAllowancesFinal = 300000;
    if (totalIncome <= 5000000) {
      standardDeductionFinal = 50000;
    } else {
      standardDeductionFinal = 0;
    }
  } else if (ageCategory == AgeCategory.between60and80) {
    exemptAllowancesFinal = 300000;
    if (totalIncome <= 3500000) {
      standardDeductionFinal = 50000;
    } else {
      standardDeductionFinal = 0;
    }
  } else {
    exemptAllowancesFinal = exemptAllowances;
    standardDeductionFinal = 50000;
  }

  double taxableIncome = totalIncome -
      exemptAllowancesFinal -
      standardDeductionFinal -
      chapterVIADeductions;

  double incomeTax = 0.0;
  double healthAndEducationCess = 0.0;
  double totalTax = 0.0;

  // Add surcharge and education cess as applicable
  if (financialYear == "FY 2023-2024") {
    double surcharge = 0.0;

    if (ageCategory == AgeCategory.between60and80) {
      surcharge = incomeTax * 0.15;
    } else if (ageCategory == AgeCategory.above80) {
      surcharge = incomeTax * 0.25;
    } else if (taxableIncome > 5000000) {
      surcharge = incomeTax * 0.1;
    }

    incomeTax += surcharge;
  }

  if (taxableIncome <= 250000) {
    incomeTax = 0;
    healthAndEducationCess = 0;
    totalTax = 0;
  } else if (taxableIncome <= 500000) {
    incomeTax = (taxableIncome - 250000) * 0.05;
    healthAndEducationCess = incomeTax * 0.04;
    totalTax = incomeTax + healthAndEducationCess;
  } else if (taxableIncome <= 750000) {
    incomeTax = (taxableIncome - 500000) * 0.1 + 12500;
    healthAndEducationCess = incomeTax * 0.04;
  } else if (taxableIncome <= 750000) {
    incomeTax = (taxableIncome - 500000) * 0.1 + 12500;
    healthAndEducationCess = incomeTax * 0.04;
  } else if (taxableIncome <= 1000000) {
    incomeTax = (taxableIncome - 750000) * 0.15 + 37500;
    healthAndEducationCess = incomeTax * 0.04;
  } else if (taxableIncome <= 1250000) {
    incomeTax = (taxableIncome - 1000000) * 0.2 + 75000;
    healthAndEducationCess = incomeTax * 0.04;
  } else if (taxableIncome <= 1500000) {
    incomeTax = (taxableIncome - 1250000) * 0.25 + 125000;
    healthAndEducationCess = incomeTax * 0.04;
  } else {
    incomeTax = (taxableIncome - 1500000) * 0.3 + 187500;
    healthAndEducationCess = incomeTax * 0.04;
  }

  totalTax = incomeTax + healthAndEducationCess;

  return IncomeTaxCalcResult(
    totalIncome: totalIncome,
    exemptAllowances: exemptAllowances,
    standardDeduction: standardDeductionFinal,
    chapterVIADeductions: chapterVIADeductions,
    taxableIncome: taxableIncome,
    incomeTax: incomeTax,
    healthAndEducationCess: healthAndEducationCess,
    totalTax: totalTax,
  );
}
