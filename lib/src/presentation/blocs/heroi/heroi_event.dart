import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class HeroiEvent extends Equatable {}

class HeroiStarted extends HeroiEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'HeroiFetched { }';
}

class HeroiFetched extends HeroiEvent {
  final String nomeHeroi;

  HeroiFetched({
    @required this.nomeHeroi,
  });

  @override
  List<Object> get props {
    return [
      nomeHeroi,
    ];
  }

  @override
  String toString() {
    return 'Heroi Fetched { nomeHeroi: $nomeHeroi }';
  }
}
