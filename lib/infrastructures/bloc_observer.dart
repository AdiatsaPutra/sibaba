import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    Logger().d('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Logger().d('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    Logger().d('onChange ${bloc.runtimeType}'
        'From: ${change.currentState}'
        'To: ${change.nextState}');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    Logger().d('Close ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    Logger().d('Create ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger().d('Error in : ${bloc.runtimeType}'
        'Error: $error'
        'StackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
