import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    developer.log('onChange --- bloc: ${bloc.runtimeType}, change: $change');
  }
}
