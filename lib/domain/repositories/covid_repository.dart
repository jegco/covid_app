import 'package:covidapp/domain/models/models.dart';

abstract class CovidRepository {
  Future<CovidSummary> getCovidSummary(String countryName);
}