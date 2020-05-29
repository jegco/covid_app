import 'package:covidapp/domain/models/models.dart';
import 'package:covidapp/domain/usecases/base/use_case.dart';
import 'package:covidapp/presentation/global/global_event.dart';
import 'package:covidapp/presentation/global/global_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final UseCase<String, CovidSummary> getUseCase;
  final UseCase<String, CovidSummary> updateUseCase;

  GlobalBloc({@required this.getUseCase, @required this.updateUseCase});

  @override
  GlobalState get initialState => GlobalDataIsLoading();

  @override
  Stream<GlobalState> mapEventToState(GlobalEvent event) async* {
    if (event is LoadGlobalData) {
      yield* loadGlobalData();
    } else if (event is UpdateGlobalData) {
      yield* updateGlobalData();
    }
  }

  Stream<GlobalState> loadGlobalData() async* {
    try {
      final summary = await getUseCase.execute(null);
      yield GlobalDataLoaded(summary: summary);
    } catch (_) {
      yield GlobalDataNotLoaded();
    }
  }

  Stream<GlobalState> updateGlobalData() async* {
    try {
      final summary = await updateUseCase.execute(null);
      yield GlobalDataLoaded(summary: summary);
    } catch (_) {
      yield GlobalDataNotLoaded();
    }
  }
}
