import 'package:flutter/material.dart';

import '../blocs/home_bloc.dart';

class HomeBlocProvider extends InheritedWidget {

  final HomeBloc bloc;

  HomeBlocProvider({Key? key, required super.child})
  : bloc = HomeBloc(), super(key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      this != oldWidget;

  static HomeBlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeBlocProvider>();
  }
}
