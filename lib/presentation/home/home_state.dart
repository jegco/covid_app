import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  HomeState({int selectedIndex = 0}): super();
}

class Global extends HomeState {

  final int selectedIndex = 1;

  Global(): super();

  @override
  String toString() => 'global';
}

class Colombia extends HomeState {

  final int selectedIndex = 0;

  Colombia(): super();

  @override
  String toString() => 'colombia';
}