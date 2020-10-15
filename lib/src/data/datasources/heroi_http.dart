import 'package:coolsql/core/managers/http/http_manager.dart';
import 'package:coolsql/core/utils/constants.dart';
import 'package:coolsql/core/utils/exceptions.dart';
import 'package:flutter/foundation.dart';
import '../models/models.dart';

abstract class HeroiRemoteSource {
  Future<List<HeroiModel>> pesquisarHeroiPorNome({
    String nome,
  });
}

class HeroiRemoteSourceImpl implements HeroiRemoteSource {
  final HttpManager manager;

  HeroiRemoteSourceImpl({
    @required this.manager,
  });

  @override
  Future<List<HeroiModel>> pesquisarHeroiPorNome({
    String nome,
  }) async {
    try {
      final urlCompleta = '$URL_BASE/search/$nome';

      final response = await manager.getRequest(
        urlCompleta,
      );

      print(urlCompleta);

      if (!response['response'].toString().contains('success')) {
        throw RequestException(erro: 'Nenhum heroi encontrado!');
      }

      var dados = response['results'] as List;

      return dados.map((dado) => HeroiModel.fromMap(dado)).toList();
    } catch (e) {
      throw e;
    }
  }
}
