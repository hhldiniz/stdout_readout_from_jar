import 'dart:async';
import 'dart:io';

import 'base_bloc.dart';

class HomeBloc extends BaseBloc {
  final StreamController<List<String>> _stdOutputController = StreamController();

  Stream<List<String>> get stdOut => _stdOutputController.stream;

  void runJavaCode() {
    Process.run('java', ['-jar', 'assets/hello_java.jar']).then((value) {
      return _stdOutputController.sink.add(value.stdout.toString().split("\n"));
    });
  }

  @override
  void dispose() {
    _stdOutputController.close();
  }
}
