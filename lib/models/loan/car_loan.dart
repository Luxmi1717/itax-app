// To parse this JSON data, do
//
//     final carLoanCalc = carLoanCalcFromJson(jsonString);

import 'dart:convert';

CarLoanCalc carLoanCalcFromJson(String str) =>
    CarLoanCalc.fromJson(json.decode(str));

String carLoanCalcToJson(CarLoanCalc data) => json.encode(data.toJson());

class CarLoanCalc {
  CarLoanCalc({
    this.success,
    this.results,
  });

  bool? success;
  Results? results;

  factory CarLoanCalc.fromJson(Map<String, dynamic> json) => CarLoanCalc(
        success: json["success"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "results": results?.toJson(),
      };
}

class Results {
  Results({
    this.status,
    this.emi,
    this.loanAmount,
    this.totalInterest,
    this.totalAmount,
    this.monthlyPayment,
  });

  String? status;
  int? emi;
  int? loanAmount;
  int? totalInterest;
  int? totalAmount;
  List<MonthlyPayment>? monthlyPayment;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        status: json["status"],
        emi: json["emi"],
        loanAmount: json["loanAmount"],
        totalInterest: json["totalInterest"],
        totalAmount: json["totalAmount"],
        monthlyPayment: json["monthlyPayment"] == null
            ? []
            : List<MonthlyPayment>.from(
                json["monthlyPayment"]!.map((x) => MonthlyPayment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "emi": emi,
        "loanAmount": loanAmount,
        "totalInterest": totalInterest,
        "totalAmount": totalAmount,
        "monthlyPayment": monthlyPayment == null
            ? []
            : List<dynamic>.from(monthlyPayment!.map((x) => x.toJson())),
      };
}

class MonthlyPayment {
  MonthlyPayment({
    this.month,
    this.emi,
    this.towardsLoan,
    this.towardsInterest,
    this.outstandingLoan,
  });

  int? month;
  int? emi;
  int? towardsLoan;
  int? towardsInterest;
  int? outstandingLoan;

  factory MonthlyPayment.fromJson(Map<String, dynamic> json) => MonthlyPayment(
        month: json["month"],
        emi: json["emi"],
        towardsLoan: json["towards_loan"],
        towardsInterest: json["towards_interest"],
        outstandingLoan: json["outstanding_loan"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "emi": emi,
        "towards_loan": towardsLoan,
        "towards_interest": towardsInterest,
        "outstanding_loan": outstandingLoan,
      };
}