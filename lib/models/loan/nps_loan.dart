// To parse this JSON data, do
//
//     final npsLoanCalc = npsLoanCalcFromJson(jsonString);

import 'dart:convert';

NpsLoanCalc npsLoanCalcFromJson(String str) =>
    NpsLoanCalc.fromJson(json.decode(str));

String npsLoanCalcToJson(NpsLoanCalc data) => json.encode(data.toJson());

class NpsLoanCalc {
  NpsLoanCalc({
    this.success,
    this.results,
  });

  bool? success;
  Results? results;

  factory NpsLoanCalc.fromJson(Map<String, dynamic> json) => NpsLoanCalc(
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
    this.total,
    this.invested,
    this.gain,
    this.yearlyGain,
  });

  String? status;
  int? total;
  int? invested;
  int? gain;
  List<YearlyGain>? yearlyGain;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        status: json["status"],
        total: json["total"],
        invested: json["invested"],
        gain: json["gain"],
        yearlyGain: json["yearlyGain"] == null
            ? []
            : List<YearlyGain>.from(
                json["yearlyGain"]!.map((x) => YearlyGain.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
        "invested": invested,
        "gain": gain,
        "yearlyGain": yearlyGain == null
            ? []
            : List<dynamic>.from(yearlyGain!.map((x) => x.toJson())),
      };
}

class YearlyGain {
  YearlyGain({
    this.year,
    this.investmentAmount,
    this.interestEarned,
    this.maturityAmount,
  });

  int? year;
  int? investmentAmount;
  int? interestEarned;
  int? maturityAmount;

  factory YearlyGain.fromJson(Map<String, dynamic> json) => YearlyGain(
        year: json["year"],
        investmentAmount: json["investment_amount"],
        interestEarned: json["interest_earned"],
        maturityAmount: json["maturity_amount"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "investment_amount": investmentAmount,
        "interest_earned": interestEarned,
        "maturity_amount": maturityAmount,
      };
}