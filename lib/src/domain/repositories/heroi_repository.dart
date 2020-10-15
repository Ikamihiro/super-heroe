import 'package:coolsql/src/domain/entities/entities.dart';

abstract class HeroiRepository {
  Future<List<Heroi>> pesquisarHeroiPorNome({
    String nome,
  });

  Future<List<Heroi>> pegarHeroisPesquisados();
}
