import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tiket_nonton/services/services.dart';
import 'package:tiket_nonton/ui/widgets/widgets.dart';
import 'blocs/blocs.dart';
import 'package:tiket_nonton/ui/pages/pages.dart';
import 'package:tiket_nonton/enums/connectivity_status.dart';
import 'package:connectivity/connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: ConnectivityService().connectionStatusController.stream,
      child: StreamProvider.value(
        value: AuthServices.userStream,
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => PageBloc()),
              BlocProvider(create: (_) => UserBloc()),
              BlocProvider(create: (_) => ThemeBloc()),
              BlocProvider(create: (_) => MovieBloc()..add(FetchMovie())),
              BlocProvider(create: (_) => TicketBloc())
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: NetworkSensitive(child: Wrapper())),
            )),
      ),
    );
  }
}
