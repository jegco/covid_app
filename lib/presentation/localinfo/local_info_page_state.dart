import 'package:covidapp/domain/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LocalInfoState extends Equatable {
  LocalInfoState([List props = const []]): super(props);
}

@immutable
class LocalInfoDataIsLoading extends LocalInfoState {
  @override
  String toString() => 'DataIsLoading';
}

@immutable
class LocalInfoDataLoaded extends LocalInfoState {
  final Country data;

  LocalInfoDataLoaded({@required this.data}): super([data]);

  @override
  String toString() => 'DataLoaded';
}

@immutable
class LocalInfoDataNotLoaded extends LocalInfoState {
  @override
  String toString() => 'DataNotLoaded';
}