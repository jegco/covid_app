import 'package:equatable/equatable.dart';

abstract class LocalInfoEvent extends Equatable{
  LocalInfoEvent([List props = const []]) : super(props);
}

class LoadLocalInfoData extends LocalInfoEvent {
  @override
  String toString() => 'LoadData';
}

class UpdateLocalInfoData extends LocalInfoEvent {
  @override
  String toString() => 'UpdateData';
}