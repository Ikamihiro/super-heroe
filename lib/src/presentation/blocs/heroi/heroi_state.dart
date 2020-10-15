import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class HeroiState extends Equatable {}

class HeroiInitial extends HeroiState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'HeroiInitial { }';
}

class HeroiLoadProgress extends HeroiState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'HeroiLoadProgress { }';
}

class HeroiLoadSuccess extends HeroiState {
  final List<Heroi> herois;

  HeroiLoadSuccess({
    @required this.herois,
  });

  @override
  List<Object> get props {
    return [
      herois,
    ];
  }

  @override
  String toString() {
    return 'HeroiLoadSuccess { heroi: ${herois.length} }';
  }
}

class HeroiFailure extends HeroiState {
  final String errorMessage;

  HeroiFailure({
    @required this.errorMessage,
  });

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HeroiFailure { errorMessage: $errorMessage }';
}
