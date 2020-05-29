import 'package:covidapp/presentation/home/home_event.dart';
import 'package:covidapp/presentation/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  @override
  HomeState get initialState => Colombia();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if ( event is NavigateToColombia ) {
      yield Colombia();
    } else {
      yield Global();
    }
  }

}