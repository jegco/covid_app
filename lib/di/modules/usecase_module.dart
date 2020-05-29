import 'package:covidapp/domain/models/models.dart';
import 'package:covidapp/domain/repositories/covid_repository.dart';
import 'package:covidapp/domain/usecases/base/use_case.dart';
import 'package:covidapp/domain/usecases/covid_summary/get_covid_summary_by_country_use_case.dart';
import 'package:covidapp/domain/usecases/covid_summary/get_global_covid_summary_use_case.dart';
import 'package:covidapp/domain/usecases/covid_summary/update_covid_summary_by_country_use_case.dart';
import 'package:covidapp/domain/usecases/covid_summary/update_global_covid_summary_use_case.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class UseCaseModule {
  Injector initialise(Injector injector) {
    injector.map<UseCase<String, CovidSummary>>(
        (injector) =>
            GetGlobalCovidSummaryUseCase(injector.get<CovidRepository>()),
        isSingleton: true,
        key: 'get');
    injector.map<UseCase<String, CovidSummary>>(
        (injector) =>
            UpdateGlobalCovidSummaryUseCase(injector.get<CovidRepository>()),
        isSingleton: true,
        key: 'update');
    injector.map<UseCase<String, Country>>(
        (injector) =>
            GetCovidSummaryByCountryUseCase(injector.get<CovidRepository>()),
        isSingleton: true,
        key: 'get');
    injector.map<UseCase<String, Country>>(
        (injector) =>
            UpdateCovidSummaryByCountryUseCase(injector.get<CovidRepository>()),
        isSingleton: true,
        key: 'update');
    return injector;
  }
}
