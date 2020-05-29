import 'package:meta/meta.dart';

import 'country.dart';
import 'global.dart';

@immutable
class CovidSummary {
  final Global global;
  final List<Country> countries;
  final DateTime date;

  CovidSummary({
    this.global,
    this.countries,
    this.date,
  });

  factory CovidSummary.fromJson(dynamic json) => CovidSummary(
        global: Global.fromJson(json["Global"]),
        countries: List<Country>.from(
            json["Countries"].map((x) => Country.fromJson(x))),
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Global": global.toJson(),
        "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "Date": date.toIso8601String(),
      };
}
