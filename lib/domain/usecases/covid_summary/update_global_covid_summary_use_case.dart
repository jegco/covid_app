import 'package:covidapp/domain/models/models.dart';
import 'package:covidapp/domain/usecases/base/use_case_imp.dart';
import 'package:covidapp/persistence/repositories/covid_summary_repository_imp.dart';

class UpdateGlobalCovidSummaryUseCase extends UseCaseImp<String, CovidSummary> {
  final CovidSummaryRepositoryImp _repository;

  UpdateGlobalCovidSummaryUseCase(this._repository) : super(false);

  @override
  Future<CovidSummary> buildUseCase(String params) =>
      _repository.getCovidSummary(params);
}
