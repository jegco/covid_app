import 'package:covidapp/domain/models/models.dart';
import 'package:covidapp/domain/repositories/covid_repository.dart';
import 'package:covidapp/domain/usecases/base/use_case_imp.dart';

class GetCovidSummaryByCountryUseCase extends UseCaseImp<String, Country> {

  final CovidRepository _repository;

  GetCovidSummaryByCountryUseCase(this._repository): super(true);

  @override
  Future<Country> buildUseCase(String params) async {
    final result = await _repository.getCovidSummary(null);
    final country = result.countries
        .where((Country countryData) => countryData.country == params).toList();
    return country.length > 0 ? country.first : throw Exception();
  }
}
