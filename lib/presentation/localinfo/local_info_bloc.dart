import 'package:covidapp/domain/models/country.dart';
import 'package:covidapp/domain/usecases/base/use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_info_event.dart';
import 'local_info_page_state.dart';

class LocalInfoBloc extends Bloc<LocalInfoEvent, LocalInfoState> {
  final UseCase<String, Country> getUseCase;
  final UseCase<String, Country> updateUseCase;

  LocalInfoBloc({@required this.getUseCase, @required this.updateUseCase});

  @override
  LocalInfoState get initialState => LocalInfoDataIsLoading();

  @override
  Stream<LocalInfoState> mapEventToState(LocalInfoEvent event) async* {
    if ( event is LoadLocalInfoData ) {
      yield* loadData();
    }
    else if ( event is UpdateLocalInfoData ) {
      yield* updateData();
    }
  }

  Stream<LocalInfoState> loadData() async* {
    try {
      final data = await this.getUseCase.execute('Colombia');
      yield LocalInfoDataLoaded(data: data);
    } catch (_) {
      yield LocalInfoDataNotLoaded();
    }
  }

  Stream<LocalInfoState> updateData() async* {
    try {
      final data = await this.updateUseCase.execute('Colombia');
      yield LocalInfoDataLoaded(data: data);
    } catch (_) {
      yield LocalInfoDataNotLoaded();
    }
  }
}
