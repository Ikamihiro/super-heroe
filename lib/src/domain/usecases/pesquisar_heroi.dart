import 'package:coolsql/src/domain/entities/entities.dart';
import 'package:coolsql/src/domain/repositories/heroi_repository.dart';
import 'package:flutter/foundation.dart';

class PegarHeroiPorNome {
  final HeroiRepository repository;

  PegarHeroiPorNome({
    @required this.repository,
  });

  Future<List<Heroi>> call({
    String nome,
  }) async {
    return await repository.pesquisarHeroiPorNome(nome: nome);
  }
}
