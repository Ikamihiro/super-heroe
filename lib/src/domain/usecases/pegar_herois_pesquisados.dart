import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:coolsql/src/domain/repositories/heroi_repository.dart';
import 'package:flutter/foundation.dart';

class PegarHeroisPesquisados {
  final HeroiRepository repository;

  PegarHeroisPesquisados({
    @required this.repository,
  });

  Future<List<Heroi>> call() async {
    return await repository.pegarHeroisPesquisados();
  }
}
