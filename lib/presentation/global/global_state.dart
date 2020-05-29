import 'package:covidapp/domain/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class GlobalState extends Equatable {
  GlobalState([List props = const []]) : super(props);
}

@immutable
class GlobalDataIsLoading extends GlobalState {
  @override
  String toString() => 'GlobalDataIsLoading';
}

@immutable
class GlobalDataLoaded extends GlobalState {
  final CovidSummary summary;

  GlobalDataLoaded({@required this.summary}) : super([summary]);

  @override
  String toString() => 'GlobalDataLoaded';
}

@immutable
class GlobalDataNotLoaded extends GlobalState {
  @override
  String toString() => 'GlobalDataNotLoaded';
}
