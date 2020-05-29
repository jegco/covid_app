import 'package:covidapp/persistence/services/client_conf.dart';
import 'package:covidapp/persistence/services/covid_summary_service.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class ServiceModule {
  Injector initialise(Injector injector) {
    injector.map<ClientConf>((injector) => ClientConf(), isSingleton: true);
    injector.map<CovidSummaryService>((injector) => CovidSummaryService(injector.get<ClientConf>().client), isSingleton: true);
    return injector;
  }
}