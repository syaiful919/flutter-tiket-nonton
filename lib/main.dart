import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiket_nonton/services/services.dart';
import 'package:tiket_nonton/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()),
    );
  }
}
