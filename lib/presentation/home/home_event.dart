import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class NavigateToColombia extends HomeEvent {

  @override
  String toString() => 'navigateToColombia';
}

class NavigateToGlobal extends HomeEvent {

  @override
  String toString() => 'navigateToGlobal';
}