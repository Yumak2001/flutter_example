import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../first.dart';

class FirstPage extends StatefulWidget {
  static const id = '/first';

  FirstPage({required Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstBloc, FirstState>(
      builder: (context, state) {
        return Scaffold(
          key: FirstPageKeys.scaffold,
          backgroundColor: Colors.black.withOpacity(0.54),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
