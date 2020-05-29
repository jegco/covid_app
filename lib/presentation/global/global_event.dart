import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class GlobalEvent extends Equatable {
  GlobalEvent([List props = const []]) : super(props);
}

@immutable
class LoadGlobalData extends GlobalEvent {
  @override
  String toString() => 'LoadGlobalData';
}

@immutable
class UpdateGlobalData extends GlobalEvent {
  @override
  String toString() => 'UpdateGlobalData';
}
