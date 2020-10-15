import 'package:coolsql/src/data/datasources/heroi_http.dart';
import 'package:coolsql/src/data/datasources/heroi_local.dart';
import 'package:coolsql/src/domain/entities/heroi.dart';
import 'package:coolsql/src/domain/repositories/heroi_repository.dart';
import 'package:flutter/foundation.dart';

class HeroiRepositoryImpl implements HeroiRepository {
  final HeroiRemoteSource remoteSource;
  final HeroiLocalSource localSource;

  HeroiRepositoryImpl({
    @required this.remoteSource,
    @required this.localSource,
  });

  @override
  Future<List<Heroi>> pegarHeroisPesquisados() async {
    try {
      return await localSource.pegarHeroisPesquisados();
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Heroi>> pesquisarHeroiPorNome({
    String nome,
  }) async {
    try {
      return await remoteSource.pesquisarHeroiPorNome(
        nome: nome,
      );
    } catch (e) {
      throw e;
    }
  }
}
