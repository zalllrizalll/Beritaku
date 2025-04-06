import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('bloc: $bloc, change: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('bloc: $bloc, error: $error, stackTrace: $stackTrace');
  }
}
