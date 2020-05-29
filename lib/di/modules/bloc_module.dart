import 'package:covidapp/domain/models/models.dart';
import 'package:covidapp/domain/usecases/base/use_case.dart';
import 'package:covidapp/presentation/global/global_bloc.dart';
import 'package:covidapp/presentation/home/home_bloc.dart';
import 'package:covidapp/presentation/localinfo/local_info_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class BlocModule {
  Injector initialise(Injector injector) {
    injector.map<HomeBloc>((injector) => HomeBloc(), isSingleton: true);
    injector.map<LocalInfoBloc>(
        (injector) => LocalInfoBloc(
            getUseCase: injector.get<UseCase<String, Country>>(key: 'get'),
            updateUseCase:
                injector.get<UseCase<String, Country>>(key: 'update')),
        isSingleton: true);
    injector.map<GlobalBloc>(
        (injector) => GlobalBloc(
            getUseCase: injector.get<UseCase<String, CovidSummary>>(key: 'get'),
            updateUseCase:
                injector.get<UseCase<String, CovidSummary>>(key: 'update')),
        isSingleton: true);
    return injector;
  }
}
