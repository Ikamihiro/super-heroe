import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coolsql/core/utils/exceptions.dart';
import 'package:coolsql/src/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';
import 'heroi_event.dart';
import 'heroi_state.dart';

class HeroiBloc extends Bloc<HeroiEvent, HeroiState> {
  final PegarHeroiPorNome pegarHeroiPorNome;
  final PegarHeroisPesquisados pegarHeroisPesquisados;

  HeroiBloc({
    @required this.pegarHeroiPorNome,
    @required this.pegarHeroisPesquisados,
  }) : super(HeroiInitial());

  @override
  Stream<HeroiState> mapEventToState(
    HeroiEvent event,
  ) async* {
    if (event is HeroiStarted) {
      yield* _mapHeroiStartedEvent(event);
    } else if (event is HeroiFetched) {
      yield* _mapHeroiFetchedEvent(event);
    }
  }

  Stream<HeroiState> _mapHeroiStartedEvent(
    HeroiStarted event,
  ) async* {
    try {
      yield HeroiLoadProgress();

      await Future.delayed(Duration(seconds: 3));

      yield HeroiInitial();
    } catch (e) {
      print(e.toString());
      yield HeroiFailure(errorMessage: e.toString());
    }
  }

  Stream<HeroiState> _mapHeroiFetchedEvent(
    HeroiFetched event,
  ) async* {
    try {
      yield HeroiLoadProgress();

      final herois = await pegarHeroiPorNome(nome: event.nomeHeroi);

      yield HeroiLoadSuccess(herois: herois);
    } on RequestException catch (e) {
      print(e.erro);
      yield HeroiFailure(errorMessage: e.erro);
    } catch (e) {
      print(e.toString());
      yield HeroiFailure(errorMessage: e.toString());
    }
  }
}
