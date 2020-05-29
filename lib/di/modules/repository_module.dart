import 'package:covidapp/domain/repositories/covid_repository.dart';
import 'package:covidapp/persistence/repositories/covid_summary_repository_imp.dart';
import 'package:covidapp/persistence/services/covid_summary_service.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class RepositoryModule {
  Injector initialise(Injector injector) {
    injector.map<CovidRepository>(
        (injector) =>
            CovidSummaryRepositoryImp(injector.get<CovidSummaryService>()),
        isSingleton: true);
    return injector;
  }
}
