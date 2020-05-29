import 'package:covidapp/domain/models/models.dart';
import 'package:covidapp/domain/usecases/base/use_case_imp.dart';
import 'package:covidapp/persistence/repositories/covid_summary_repository_imp.dart';

class GetGlobalCovidSummaryUseCase extends UseCaseImp<String, CovidSummary> {
  final CovidSummaryRepositoryImp _repository;

  GetGlobalCovidSummaryUseCase(this._repository) : super(true);

  @override
  Future<CovidSummary> buildUseCase(String params) =>
      _repository.getCovidSummary(params);
}
