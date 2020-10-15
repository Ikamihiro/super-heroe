import 'package:coolsql/src/presentation/blocs/bloc_observer.dart';
import 'package:coolsql/src/presentation/blocs/heroi/heroi.dart';
import 'package:coolsql/src/presentation/pages/home/home_page.dart';
//import 'package:coolsql/src/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart';

void main() async {
  await setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider<HeroiBloc>(
      create: (context) => getIt<HeroiBloc>()..add(HeroiStarted()),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Heroes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Init(),
    );
  }
}

class Init extends StatelessWidget {
  const Init({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HeroiBloc, HeroiState>(
        builder: (BuildContext context, HeroiState state) {
          if (state is HeroiLoadSuccess) {
            return Center(
              child: Text('Carregado'),
            );
          }

          if (state is HeroiFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${state.errorMessage}'),
                  RaisedButton(
                    onPressed: () {
                      BlocProvider.of<HeroiBloc>(context).add(HeroiStarted());
                    },
                    child: Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          if (state is HeroiInitial) {
            return HomePage();
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
