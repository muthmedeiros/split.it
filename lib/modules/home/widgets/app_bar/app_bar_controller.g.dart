// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppBarController on _AppBarControllerBase, Store {
  final _$stateAtom = Atom(name: '_AppBarControllerBase.state');

  @override
  AppBarState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppBarState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$getDashboardAsyncAction =
      AsyncAction('_AppBarControllerBase.getDashboard');

  @override
  Future getDashboard() {
    return _$getDashboardAsyncAction.run(() => super.getDashboard());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
