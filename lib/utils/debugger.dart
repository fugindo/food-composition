import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('OnEvent: ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('OnChange: ${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('OnTransition: ${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('OnError: ${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
