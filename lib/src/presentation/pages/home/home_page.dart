import 'package:coolsql/src/presentation/blocs/heroi/heroi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tHeroi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final heroiBloc = BlocProvider.of<HeroiBloc>(context);

    void _pesquisarHeroi() {
      var heroi = _tHeroi.text;

      if (heroi.isNotEmpty) {
        heroiBloc.add(
          HeroiFetched(nomeHeroi: heroi),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Opa!!'),
              content: Text('Tem que digitar um nome para pesquisar né!'),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Digite o nome do seu superherói favorito:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    color: Colors.grey[200],
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _tHeroi,
                decoration: InputDecoration(
                  hintText: 'Digite o nome do superherói',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pesquisarHeroi();
                    },
                    child: ClipOval(
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        color: Colors.blue,
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
