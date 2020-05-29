import 'package:covidapp/di/component/module_container.dart';
import 'package:covidapp/presentation/base/covid_bloc_delegate.dart';
import 'package:covidapp/presentation/global/global_bloc.dart';
import 'package:covidapp/presentation/home/home_bloc.dart';
import 'package:covidapp/presentation/home/home_page.dart';
import 'package:covidapp/presentation/localinfo/local_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
  BlocSupervisor.delegate = CovidBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HomeBloc _homeBloc;
  LocalInfoBloc _colombiaBloc;
  GlobalBloc _globalBloc;

  @override
  void initState() {
    final injector = ModuleContainer().initialise(Injector.getInjector());
    _homeBloc = injector.get<HomeBloc>();
    _colombiaBloc = injector.get<LocalInfoBloc>();
    _globalBloc = injector.get<GlobalBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _homeBloc,
        ),
        BlocProvider(
          create: (context) => _colombiaBloc,
        ),
        BlocProvider(
          create: (context) => _globalBloc,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.orange[300],
          accentTextTheme: TextTheme(button: TextStyle(color: Colors.white)),
          buttonColor: Colors.white,
        ),
        home: HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    _homeBloc.close();
    _colombiaBloc.close();
    _globalBloc.close();
    super.dispose();
  }
}
