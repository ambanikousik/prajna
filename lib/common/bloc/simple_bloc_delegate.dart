import 'package:bloc/bloc.dart';

class SimpleBlocDelegate extends BlocObserver{
  @override

  @override
  onTransition(Cubit cubit, Transition transition) {
    super.onTransition(cubit, transition);
    print('onTransition $transition');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    print('onError $error');
  }
}
