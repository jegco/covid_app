import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    print(stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}