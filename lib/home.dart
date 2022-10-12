import 'package:flutter/material.dart';
import 'package:java_stacktrace_poc/blocs/home_bloc.dart';
import 'package:java_stacktrace_poc/providers/home_bloc_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc? _bloc;

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = HomeBlocProvider.of(context)?.bloc;

    return Scaffold(
      body: StreamBuilder<List<String>>(
        builder: (context, snapshot) {
          return Column(
            children: snapshot.data
                    ?.asMap()
                    .entries
                    .map((entry) => Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(entry.key.toString()),
                            const SizedBox(width: 8),
                            Text(entry.value)
                          ],
                        ))
                    .toList() ??
                [],
          );
        },
        initialData: const [],
        stream: _bloc?.stdOut,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _bloc?.runJavaCode();
          },
          label: const Text("Call java code")),
    );
  }
}
