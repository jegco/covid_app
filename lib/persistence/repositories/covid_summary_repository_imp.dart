import 'package:covidapp/domain/models/covid_summary.dart';
import 'package:covidapp/domain/repositories/covid_repository.dart';
import 'package:covidapp/persistence/services/covid_summary_service.dart';

class CovidSummaryRepositoryImp implements CovidRepository {
  final CovidSummaryService _service;

  CovidSummaryRepositoryImp(this._service);

  @override
  Future<CovidSummary> getCovidSummary(String countryName) =>
      _service.getCovidSummary(countryName);
}
